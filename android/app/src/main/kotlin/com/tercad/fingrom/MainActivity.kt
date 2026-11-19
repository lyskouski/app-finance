package com.tercad.fingrom

import android.os.Handler
import android.os.Looper
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NotificationChannelHandler.CHANNEL)
        channel.setMethodCallHandler { call, result -> NotificationChannelHandler.handle(this, call, result) }
        notificationChannel = channel
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        notificationChannel = null
        super.cleanUpFlutterEngine(flutterEngine)
    }

    companion object {
        @Volatile
        private var notificationChannel: MethodChannel? = null

        val isAttached: Boolean
            get() = notificationChannel != null

        fun onNotificationCaptured(): Boolean = invoke("onCaptured", null)

        fun onNotificationsReload(added: Int) {
            invoke("onReload", mapOf("added" to added))
        }

        private fun invoke(method: String, arguments: Any?): Boolean {
            val channel = notificationChannel ?: return false
            Handler(Looper.getMainLooper()).post { channel.invokeMethod(method, arguments) }
            return true
        }
    }
}
