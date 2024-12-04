package com.tercad.fingrom

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.net.Uri
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
            // Set up intent to connect to PaymentsAppWidgetService
            val intent = Intent(context, PaymentsWidgetService::class.java).apply {
                putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
            }
            intent.data = Uri.parse(intent.toUri(Intent.URI_INTENT_SCHEME)) // Ensure unique intent for each widget

            // Create RemoteViews
            val views = RemoteViews(context.packageName, R.layout.payments_app_widget).apply {
                setRemoteAdapter(R.id.list_view, intent) // Connect ListView with service
                setEmptyView(R.id.list_view, R.id.empty_view)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
      }
      super.onUpdate(context, appWidgetManager, appWidgetIds)
    }

    override fun onEnabled(context: Context) {
        // Enter relevant functionality for when the first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality for when the last widget is disabled
    }
}
