package com.tercad.fingrom

import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import android.widget.RemoteViewsService
import androidx.core.graphics.ColorUtils
import android.graphics.Color
import es.antonborri.home_widget.HomeWidgetPlugin
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive

class PaymentsWidgetFactory(private val context: Context, intent: Intent) : RemoteViewsService.RemoteViewsFactory {

    private val items = mutableListOf<PaymentItem>()

    override fun onCreate() {
        items.clear()
        val widgetData = HomeWidgetPlugin.getData(context)
        val store = widgetData.getString("payments_widget_data", null)
        val scope: JsonArray = Json.decodeFromString<JsonArray>(store ?: "[]")
        scope.forEach { jsonElement ->
            val jsonObject = jsonElement.jsonObject
            val title = jsonObject["title"]?.jsonPrimitive?.content ?: ""
            val description = jsonObject["description"]?.jsonPrimitive?.content ?: ""
            val details = jsonObject["details"]?.jsonPrimitive?.content ?: ""
            items.add(PaymentItem(title, details, description))
        }
    }

    override fun onDataSetChanged() {
        onCreate()
    }

    override fun getCount(): Int = items.size

    override fun getViewAt(position: Int): RemoteViews {
        val item = items[position]
        val rv = RemoteViews(context.packageName, R.layout.payment_list_item).apply {
            setTextViewText(R.id.item_title, item.title)
            setTextViewText(R.id.item_details, item.details)
            setTextViewText(R.id.item_description, item.description)
        }
        return rv
    }

    override fun getLoadingView(): RemoteViews? = null

    override fun getViewTypeCount(): Int = 1

    override fun getItemId(position: Int): Long = position.toLong()

    override fun hasStableIds(): Boolean = true

    override fun onDestroy() {
        items.clear()
    }
}