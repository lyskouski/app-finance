package com.tercad.fingrom

import android.app.Notification
import android.content.pm.PackageManager
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification

class NotificationParserService : NotificationListenerService() {
    override fun onListenerConnected() {
        super.onListenerConnected()
        val scope = NotificationStore.getPackages(this)
        if (scope.isEmpty()) {
            return
        }
        try {
            activeNotifications?.filter { scope.contains(it.packageName) }?.forEach { capture(it) }
        } catch (e: SecurityException) {
            // The access has been revoked meanwhile
        }
    }

    override fun onNotificationPosted(sbn: StatusBarNotification?) {
        if (sbn != null) {
            capture(sbn)
        }
    }

    private fun capture(sbn: StatusBarNotification) {
        if (sbn.packageName == packageName) {
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
            NotificationHeadless.onCaptured(this, sbn.packageName)
        }
    }

    private fun getLabel(name: String): String = try {
        val info = packageManager.getApplicationInfo(name, 0)
        packageManager.getApplicationLabel(info).toString()
    } catch (e: PackageManager.NameNotFoundException) {
        name
    }
}
