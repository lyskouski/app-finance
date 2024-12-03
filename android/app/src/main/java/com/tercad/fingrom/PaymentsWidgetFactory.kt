package com.tercad.fingrom

import android.content.Context
import android.widget.RemoteViews
import android.widget.RemoteViewsService
import androidx.core.graphics.ColorUtils
import android.graphics.Color

class PaymentsWidgetFactory(private val context: Context) : RemoteViewsService.RemoteViewsFactory {

    private val items = mutableListOf<PaymentItem>()

    override fun onCreate() {
        // Initial data, including color in hex format
        items.add(PaymentItem("Bill:", "-$100.00", "monthly", "#FFD700")) // Yellow for Bill
        items.add(PaymentItem("Invoice:", "+$50.00", "weekly", "#FF0000")) // Red for Invoice
        items.add(PaymentItem("Bill:", "-$20.00", "monthly", "#0000FF")) // Blue for Bill
    }

    override fun onDataSetChanged() {
        // Refresh or update data if needed
    }

    override fun onDestroy() {
        items.clear()
    }

    override fun getCount(): Int = items.size

    override fun getViewAt(position: Int): RemoteViews {
        val item = items[position]

        val rv = RemoteViews(context.packageName, R.layout.payment_list_item)
        rv.setTextViewText(R.id.item_type, item.type)
        rv.setTextViewText(R.id.item_amount, item.amount)
        rv.setTextViewText(R.id.item_interval, item.interval)

        // Set background color directly using Color.parseColor
        rv.setInt(R.id.color_bar, "setBackgroundColor", Color.parseColor(item.color))

        return rv
    }

    override fun getLoadingView(): RemoteViews? = null

    override fun getViewTypeCount(): Int = 1

    override fun getItemId(position: Int): Long = position.toLong()

    override fun hasStableIds(): Boolean = true
}
