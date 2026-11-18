package com.tercad.fingrom

import android.content.ComponentName
import android.content.Context
import android.content.SharedPreferences
import android.provider.Settings
import org.json.JSONArray
import org.json.JSONObject

object NotificationStore {
    private const val FILE = "fingrom_notifications"
    private const val KEY_PACKAGES = "packages"
    private const val KEY_AUTO = "auto"
    private const val KEY_APPS = "apps"
    private const val KEY_ITEMS = "items"
    private const val KEY_DONE = "done"
    private const val KEY_RECENT = "recent"
    private const val MAX_ITEMS = 500
    private const val MAX_APPS = 100
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
        val items = readItems(context).filter { selected.contains(it.optString("package")) }
        prefs(context).edit()
            .putStringSet(KEY_PACKAGES, selected)
            .putString(KEY_ITEMS, JSONArray(items).toString())
            .apply()
    }

    fun getAutoPackages(context: Context): Set<String> =
        prefs(context).getStringSet(KEY_AUTO, null)?.toSet() ?: emptySet()

    fun setAutoPackages(context: Context, packages: Collection<String>) {
        prefs(context).edit().putStringSet(KEY_AUTO, packages.toSet()).apply()
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

    private fun readItems(context: Context, key: String = KEY_ITEMS): List<JSONObject> {
        val array = JSONArray(prefs(context).getString(key, null) ?: "[]")
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
        val id = "$packageName:$time:${(title + text).hashCode()}"
        if (readDone(context).contains(id)) {
            return false
        }
        val items = readItems(context).toMutableList()
        val isDuplicate = (items + readItems(context, KEY_RECENT)).any {
            it.optString("package") == packageName && it.optString("text") == text &&
                it.optString("title") == title && Math.abs(it.optLong("time") - time) < DUPLICATE_WINDOW_MS
        }
        if (isDuplicate) {
            // A repeated notification should be skipped
            markDone(context, listOf(id))
            return false
        }
        items.add(
            JSONObject()
                .put("id", id)
                .put("package", packageName)
                .put("title", title)
                .put("text", text)
                .put("time", time)
                .put("captured", System.currentTimeMillis())
        )
        val tail = if (items.size > MAX_ITEMS) items.subList(items.size - MAX_ITEMS, items.size) else items
        prefs(context).edit().putString(KEY_ITEMS, JSONArray(tail).toString()).apply()
        return true
    }

    @Synchronized
    fun removeItems(context: Context, ids: Collection<String>) {
        val scope = ids.toSet()
        val (removed, items) = readItems(context).partition { scope.contains(it.optString("id")) }
        val since = System.currentTimeMillis() - DUPLICATE_WINDOW_MS
        val recent = (readItems(context, KEY_RECENT) + removed).filter { it.optLong("captured") >= since }
        prefs(context).edit()
            .putString(KEY_ITEMS, JSONArray(items).toString())
            .putString(KEY_RECENT, JSONArray(recent).toString())
            .apply()
        markDone(context, scope)
    }

    private fun markDone(context: Context, ids: Collection<String>) {
        val done = (readDone(context) + ids).distinct().takeLast(MAX_ITEMS)
        prefs(context).edit().putString(KEY_DONE, JSONArray(done).toString()).apply()
    }

    private fun readDone(context: Context): List<String> {
        val array = JSONArray(prefs(context).getString(KEY_DONE, null) ?: "[]")
        return (0 until array.length()).map { array.optString(it) }
    }
}
