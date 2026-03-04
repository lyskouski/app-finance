#pragma once

#include <flutter/plugin_registrar_windows.h>

#ifdef __cplusplus
extern "C" {
#endif

// Windows build stub for Firebase Core plugin.
//
// This project disables the native firebase_core plugin on Windows (see
// windows/CMakeLists.txt) as a workaround for Firebase C++ SDK/MSVC toolset
// incompatibilities. Flutter's generated plugin registrant still references
// this header and symbol, so we provide a no-op implementation.
void FirebaseCorePluginCApiRegisterWithRegistrar(FlutterDesktopPluginRegistrarRef registrar);

#ifdef __cplusplus
}  // extern "C"
#endif
