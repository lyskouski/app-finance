#include "my_application.h"

#include <flutter_linux/flutter_linux.h>
#ifdef GDK_WINDOWING_X11
#include <gdk/gdkx.h>
#endif

#include "flutter/generated_plugin_registrant.h"

// flutter_webrtc eagerly creates WebRTC's AudioDeviceModule as soon as its plugin registers;
// with no reachable sink that aborts the whole process with a fatal ADM init error (e.g. headless
// AppImage screenshot/test pipelines that have no PulseAudio/ALSA device). Fall back to a dummy
// sink in that case so the app can still start.
static gboolean pulse_is_reachable() {
  gchar* out = nullptr;
  gboolean reachable = g_spawn_command_line_sync("pactl info", &out, nullptr, nullptr, nullptr) && out != nullptr &&
                       g_strstr_len(out, -1, "Server String") != nullptr;
  g_free(out);
  return reachable;
}

// g_spawn_command_line_* tokenize via shell quoting rules but never invoke a real shell, so
// env/glob/subshell syntax needs an explicit "/bin/sh -c" instead.
static void spawn_shell_async(const gchar* script) {
  gchar* argv[] = {(gchar*)"/bin/sh", (gchar*)"-c", (gchar*)script, nullptr};
  g_spawn_async(nullptr, argv, nullptr, G_SPAWN_SEARCH_PATH, nullptr, nullptr, nullptr, nullptr);
}

static void ensure_audio_backend() {
  gchar* sinks = nullptr;
  if (!g_spawn_command_line_sync("pactl list short sinks", &sinks, nullptr, nullptr, nullptr) ||
      sinks == nullptr || sinks[0] != '\0') {
    g_free(sinks);
    return;
  }
  g_free(sinks);

  // The AppImage bundles pulseaudio built for a plain /usr prefix, so it can't find its own
  // versioned module directory (e.g. pulse-16.1+dfsg1/modules) once relocated under $APPDIR;
  // --daemonize=no avoids a self re-exec via /proc/self/exe that fails under sandboxes like firejail.
  spawn_shell_async(
      "dir=$(ls -d \"$APPDIR\"/usr/lib/*/pulse-*/modules 2>/dev/null | head -n1); "
      "[ -n \"$dir\" ] && export PULSE_DLPATH=\"$dir\" LD_LIBRARY_PATH=\"$dir:$LD_LIBRARY_PATH\"; "
      "exec pulseaudio --daemonize=no --exit-idle-time=-1 --disallow-exit --realtime=no --high-priority=no");
  for (int i = 0; i < 20 && !pulse_is_reachable(); i++) {
    g_usleep(100 * 1000);
  }
  g_spawn_command_line_sync("pactl load-module module-null-sink sink_name=DummyOutput", nullptr, nullptr, nullptr,
                             nullptr);
}

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);
  GtkWindow* window =
      GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));

  // Use a header bar when running in GNOME as this is the common style used
  // by applications and is the setup most users will be using (e.g. Ubuntu
  // desktop).
  // If running on X and not using GNOME then just use a traditional title bar
  // in case the window manager does more exotic layout, e.g. tiling.
  // If running on Wayland assume the header bar will work (may need changing
  // if future cases occur).
  gboolean use_header_bar = TRUE;
#ifdef GDK_WINDOWING_X11
  GdkScreen* screen = gtk_window_get_screen(window);
  if (GDK_IS_X11_SCREEN(screen)) {
    const gchar* wm_name = gdk_x11_screen_get_window_manager_name(screen);
    if (g_strcmp0(wm_name, "GNOME Shell") != 0) {
      use_header_bar = FALSE;
    }
  }
#endif
  if (use_header_bar) {
    GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_header_bar_new());
    gtk_widget_show(GTK_WIDGET(header_bar));
    gtk_header_bar_set_title(header_bar, "Fingrom");
    gtk_header_bar_set_show_close_button(header_bar, TRUE);
    gtk_window_set_titlebar(window, GTK_WIDGET(header_bar));
  } else {
    gtk_window_set_title(window, "Fingrom");
  }

  gtk_window_set_default_size(window, 1280, 720);
  if (g_file_test("assets", G_FILE_TEST_IS_DIR)) {
    gtk_window_set_icon_from_file(window, "assets/images/logo.png", NULL);
  } else {
    gtk_window_set_icon_from_file(window, "data/flutter_assets/assets/images/logo.png", NULL);
  }
  gtk_widget_show(GTK_WIDGET(window));

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(project, self->dart_entrypoint_arguments);

  FlView* view = fl_view_new(project);
  gtk_widget_show(GTK_WIDGET(view));
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));

  ensure_audio_backend();
  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

  gtk_widget_grab_focus(GTK_WIDGET(view));
}

// Implements GApplication::local_command_line.
static gboolean my_application_local_command_line(GApplication* application, gchar*** arguments, int* exit_status) {
  MyApplication* self = MY_APPLICATION(application);
  // Strip out the first argument as it is the binary name.
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_application_register(application, nullptr, &error)) {
     g_warning("Failed to register: %s", error->message);
     *exit_status = 1;
     return TRUE;
  }

  g_application_activate(application);
  *exit_status = 0;

  return TRUE;
}

// Implements GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->local_command_line = my_application_local_command_line;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

static void my_application_init(MyApplication* self) {}

MyApplication* my_application_new() {
  return MY_APPLICATION(g_object_new(my_application_get_type(),
                                     "application-id", APPLICATION_ID,
                                     "flags", G_APPLICATION_NON_UNIQUE,
                                     nullptr));
}
