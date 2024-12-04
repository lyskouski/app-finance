package com.tercad.fingrom

import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import android.widget.RemoteViewsService
import androidx.core.graphics.ColorUtils
import android.graphics.Color

import es.antonborri.home_widget.HomeWidgetPlugin

class PaymentsWidgetFactory(private val context: Context, intent: Intent) : RemoteViewsService.RemoteViewsFactory {

    private val items = mutableListOf<PaymentItem>()

    override fun onCreate() {
        items.clear()
        val widgetData = HomeWidgetPlugin.getData(context)
        val store = widgetData.getString("payments_widget_data", null)
        items.add(PaymentItem(store ?: "Not found", "-$100.00", "monthly"))
        items.add(PaymentItem("Invoice:", "+$50.00", "weekly"))
        items.add(PaymentItem("Bill: second", "-$20.00", "monthly"))
        items.add(PaymentItem("Bill: second", "-$20.00", "monthly"))
    }

    override fun onDataSetChanged() {
        onCreate()
    }

    override fun getCount(): Int = items.size

    override fun getViewAt(position: Int): RemoteViews {
        val item = items[position]
        val rv = RemoteViews(context.packageName, R.layout.payment_list_item).apply {
            setTextViewText(R.id.item_type, item.type)
            setTextViewText(R.id.item_amount, item.amount)
            setTextViewText(R.id.item_interval, item.interval)
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