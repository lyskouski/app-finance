package com.tercad.fingrom

import android.content.Context
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

object NotificationHeadless {
    private const val ENTRYPOINT = "notificationMain"
    private const val TIMEOUT_MS = 60_000L

    private val handler = Handler(Looper.getMainLooper())
    private val timeout = Runnable { stop() }
    private var engine: FlutterEngine? = null
    private var channel: MethodChannel? = null

    private var capturedAt = 0L
    private var readAt = 0L

    val isRunning: Boolean
        get() = engine != null

    fun onCaptured(context: Context, packageName: String) {
        capturedAt = SystemClock.elapsedRealtime()
        if (MainActivity.onNotificationCaptured()) {
            return
        }
        if (!NotificationStore.getAutoPackages(context).contains(packageName)) {
            return
        }
        val current = channel
        if (current != null) {
            current.invokeMethod("onCaptured", null)
            return
        }
        start(context.applicationContext)
    }

    private fun start(context: Context) {
        val loader = FlutterInjector.instance().flutterLoader()
        loader.startInitialization(context)
        loader.ensureInitializationComplete(context, null)
        val instance = FlutterEngine(context)
        val current = MethodChannel(instance.dartExecutor.binaryMessenger, NotificationChannelHandler.CHANNEL)
        current.setMethodCallHandler { call, result ->
            when (call.method) {
                "done" -> {
                    result.success(null)
                    handler.post { finish(call.argument<Int>("added") ?: 0) }
                }
                "getNotifications" -> {
                    readAt = SystemClock.elapsedRealtime()
                    NotificationChannelHandler.handle(context, call, result)
                }
                else -> NotificationChannelHandler.handle(context, call, result)
            }
        }
        engine = instance
        channel = current
        handler.postDelayed(timeout, TIMEOUT_MS)
        instance.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint(loader.findAppBundlePath(), ENTRYPOINT)
        )
    }

    private fun finish(added: Int) {
        if (capturedAt >= readAt && !MainActivity.isAttached) {
            channel?.invokeMethod("onCaptured", null)
            return
        }
        stop()
        MainActivity.onNotificationsReload(added)
    }

    fun stop() {
        handler.removeCallbacks(timeout)
        channel?.setMethodCallHandler(null)
        engine?.destroy()
        engine = null
        channel = null
    }
}
