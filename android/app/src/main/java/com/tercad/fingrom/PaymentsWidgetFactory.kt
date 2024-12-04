package com.tercad.fingrom

import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import android.widget.RemoteViewsService
import androidx.core.graphics.ColorUtils
import android.graphics.Color

class PaymentsWidgetFactory(private val context: Context, intent: Intent) : RemoteViewsService.RemoteViewsFactory {

    private val items = mutableListOf<PaymentItem>()

    override fun onCreate() {
        items.add(PaymentItem("Bill: first", "-$100.00", "monthly"))
        items.add(PaymentItem("Invoice:", "+$50.00", "weekly"))
        items.add(PaymentItem("Bill: second", "-$20.00", "monthly"))
        items.add(PaymentItem("Bill: second", "-$20.00", "monthly"))
    }

    override fun onDataSetChanged() {
        // Called when the widget data is updated.
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