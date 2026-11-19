package com.tercad.fingrom

import android.content.Context
import android.content.Intent
import android.provider.Settings
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * Calls of the channel `com.tercad.fingrom/notifications` shared by the application
 * and its background (headless) instance.
 */
object NotificationChannelHandler {
    const val CHANNEL = "com.tercad.fingrom/notifications"

    fun handle(context: Context, call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "isGranted" -> result.success(NotificationStore.isGranted(context))
            "openSettings" -> {
                val intent = Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(intent)
                result.success(null)
            }
            "getApps" -> result.success(NotificationStore.getApps(context))
            "getPackages" -> result.success(NotificationStore.getPackages(context).toList())
            "setPackages" -> {
                NotificationStore.setPackages(context, call.argument<List<String>>("packages") ?: emptyList())
                result.success(null)
            }
            "setAutoPackages" -> {
                NotificationStore.setAutoPackages(context, call.argument<List<String>>("packages") ?: emptyList())
                result.success(null)
            }
            "getNotifications" -> result.success(NotificationStore.getItems(context))
            "removeNotifications" -> {
                NotificationStore.removeItems(context, call.argument<List<String>>("ids") ?: emptyList())
                result.success(null)
            }
            "isBusy" -> result.success(NotificationHeadless.isRunning)
            else -> result.notImplemented()
        }
    }
}
