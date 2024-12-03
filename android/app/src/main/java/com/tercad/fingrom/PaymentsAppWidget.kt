package com.tercad.fingrom

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import android.widget.AdapterView

/**
 * Implementation of App Widget functionality.
 */
class PaymentsAppWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            val intent = Intent(context, PaymentsWidgetService::class.java)
            val remoteViews = RemoteViews(context.packageName, R.layout.payments_app_widget)

            // Set the adapter for the list view
            remoteViews.setRemoteAdapter(R.id.list_view, intent)

            // Set the empty view if no data is available
            remoteViews.setEmptyView(R.id.list_view, R.id.empty_view)

            // Update the widget
            appWidgetManager.updateAppWidget(appWidgetId, remoteViews)
        }
    }

    override fun onEnabled(context: Context) {
        // Enter relevant functionality for when the first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality for when the last widget is disabled
    }
}
