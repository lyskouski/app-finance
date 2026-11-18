package com.tercad.fingrom

import android.content.ComponentName
import android.content.Context
import android.content.SharedPreferences
import android.provider.Settings
import org.json.JSONArray
import org.json.JSONObject

/**
 * Buffer of notifications captured by [NotificationParserService] till they are imported by the application.
 * Only notifications of the selected applications are kept, for other ones just a name of the application is stored
 * (to allow a selection of it).
 */
object NotificationStore {
    private const val FILE = "fingrom_notifications"
    private const val KEY_PACKAGES = "packages"
    private const val KEY_APPS = "apps"
    private const val KEY_ITEMS = "items"
    private const val MAX_ITEMS = 500
    private const val MAX_APPS = 100
    // Updates of the same notification are posted again with the same content
    private const val DUPLICATE_WINDOW_MS = 60_000L

    private fun prefs(context: Context): SharedPreferences =
        context.applicationContext.getSharedPreferences(FILE, Context.MODE_PRIVATE)

    fun isGranted(context: Context): Boolean {
        val enabled = Settings.Secure.getString(context.contentResolver, "enabled_notification_listeners") ?: return false
        val component = ComponentName(context, NotificationParserService::class.java)
        return enabled.split(':').mapNotNull { ComponentName.unflattenFromString(it) }.any { it == component }
    }

    fun getPackages(context: Context): Set<String> =
        prefs(context).getStringSet(KEY_PACKAGES, null)?.toSet() ?: emptySet()

    @Synchronized
    fun setPackages(context: Context, packages: Collection<String>) {
        val selected = packages.toSet()
        // Captured notifications of deselected applications are dropped
        val items = readItems(context).filter { selected.contains(it.optString("package")) }
        prefs(context).edit()
            .putStringSet(KEY_PACKAGES, selected)
            .putString(KEY_ITEMS, JSONArray(items).toString())
            .apply()
    }

    @Synchronized
    fun getApps(context: Context): Map<String, String> {
        val json = JSONObject(prefs(context).getString(KEY_APPS, null) ?: "{}")
        return json.keys().asSequence().associateWith { json.optString(it, it) }
    }

    @Synchronized
    fun addApp(context: Context, packageName: String, label: String) {
        val json = JSONObject(prefs(context).getString(KEY_APPS, null) ?: "{}")
        if (json.optString(packageName) == label || json.length() >= MAX_APPS && !json.has(packageName)) {
            return
        }
        json.put(packageName, label)
        prefs(context).edit().putString(KEY_APPS, json.toString()).apply()
    }

    private fun readItems(context: Context): List<JSONObject> {
        val array = JSONArray(prefs(context).getString(KEY_ITEMS, null) ?: "[]")
        return (0 until array.length()).mapNotNull { array.optJSONObject(it) }
    }

    @Synchronized
    fun getItems(context: Context): List<Map<String, Any>> = readItems(context).map {
        mapOf(
            "id" to it.optString("id"),
            "package" to it.optString("package"),
            "title" to it.optString("title"),
            "text" to it.optString("text"),
            "time" to it.optLong("time"),
        )
    }

    @Synchronized
    fun addItem(context: Context, packageName: String, title: String, text: String, time: Long): Boolean {
        val items = readItems(context).toMutableList()
        val isDuplicate = items.any {
            it.optString("package") == packageName && it.optString("text") == text &&
                it.optString("title") == title && Math.abs(it.optLong("time") - time) < DUPLICATE_WINDOW_MS
        }
        if (isDuplicate) {
            return false
        }
        items.add(
            JSONObject()
                .put("id", "$packageName:$time:${(title + text).hashCode()}")
                .put("package", packageName)
                .put("title", title)
                .put("text", text)
                .put("time", time)
        )
        val tail = if (items.size > MAX_ITEMS) items.subList(items.size - MAX_ITEMS, items.size) else items
        prefs(context).edit().putString(KEY_ITEMS, JSONArray(tail).toString()).apply()
        return true
    }

    @Synchronized
    fun removeItems(context: Context, ids: Collection<String>) {
        val scope = ids.toSet()
        val items = readItems(context).filterNot { scope.contains(it.optString("id")) }
        prefs(context).edit().putString(KEY_ITEMS, JSONArray(items).toString()).apply()
    }
}
