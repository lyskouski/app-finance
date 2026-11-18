package com.tercad.fingrom

import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NOTIFICATION_CHANNEL)
        notificationChannel = channel
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "isGranted" -> result.success(NotificationStore.isGranted(this))
                "openSettings" -> {
                    val intent = Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(intent)
                    result.success(null)
                }
                "getApps" -> result.success(NotificationStore.getApps(this))
                "getPackages" -> result.success(NotificationStore.getPackages(this).toList())
                "setPackages" -> {
                    NotificationStore.setPackages(this, call.argument<List<String>>("packages") ?: emptyList())
                    result.success(null)
                }
                "getNotifications" -> result.success(NotificationStore.getItems(this))
                "removeNotifications" -> {
                    NotificationStore.removeItems(this, call.argument<List<String>>("ids") ?: emptyList())
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        notificationChannel = null
        super.cleanUpFlutterEngine(flutterEngine)
    }

    companion object {
        const val NOTIFICATION_CHANNEL = "com.tercad.fingrom/notifications"

        // Set while the application is running, to deliver captured notifications without a delay
        @Volatile
        private var notificationChannel: MethodChannel? = null

        fun onNotificationCaptured() {
            val channel = notificationChannel ?: return
            Handler(Looper.getMainLooper()).post { channel.invokeMethod("onCaptured", null) }
        }
    }
}
