package com.tercad.fingrom

import android.app.Notification
import android.content.pm.PackageManager
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification

/**
 * Captures notifications of the applications selected by the user (banks, payment services, messengers with
 * bank SMS) to be parsed into transactions by the Flutter side.
 */
class NotificationParserService : NotificationListenerService() {
    override fun onNotificationPosted(sbn: StatusBarNotification?) {
        if (sbn == null || sbn.packageName == packageName) {
            return
        }
        val notification = sbn.notification ?: return
        val flags = notification.flags
        if (flags and Notification.FLAG_GROUP_SUMMARY != 0 || flags and Notification.FLAG_ONGOING_EVENT != 0) {
            return
        }
        NotificationStore.addApp(this, sbn.packageName, getLabel(sbn.packageName))
        if (!NotificationStore.getPackages(this).contains(sbn.packageName)) {
            return
        }
        val extras = notification.extras ?: return
        val title = extras.getCharSequence(Notification.EXTRA_TITLE)?.toString() ?: ""
        val text = (extras.getCharSequence(Notification.EXTRA_BIG_TEXT)
            ?: extras.getCharSequence(Notification.EXTRA_TEXT))?.toString() ?: ""
        if (text.isBlank()) {
            return
        }
        val time = if (notification.`when` > 0) notification.`when` else sbn.postTime
        if (NotificationStore.addItem(this, sbn.packageName, title.trim(), text.trim(), time)) {
            MainActivity.onNotificationCaptured()
        }
    }

    private fun getLabel(name: String): String = try {
        val info = packageManager.getApplicationInfo(name, 0)
        packageManager.getApplicationLabel(info).toString()
    } catch (e: PackageManager.NameNotFoundException) {
        name
    }
}
