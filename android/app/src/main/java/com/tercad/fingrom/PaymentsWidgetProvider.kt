package com.tercad.fingrom

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.widget.RemoteViews

/**
 * Implementation of App Widget functionality.
 */
class PaymentsWidgetProvider : AppWidgetProvider() {
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

            val clickTemplateIntent = Intent(context, MainActivity::class.java).apply {
                action = ACTION_OPEN_FROM_WIDGET
                putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }

            val clickPendingIntent = PendingIntent.getActivity(
                context,
                appWidgetId,
                clickTemplateIntent,
                pendingIntentFlags()
            )

            // Create RemoteViews
            val views = RemoteViews(context.packageName, R.layout.payments_app_widget).apply {
                setRemoteAdapter(R.id.list_view, intent) // Connect ListView with service
                setEmptyView(R.id.list_view, R.id.empty_view)
                setPendingIntentTemplate(R.id.list_view, clickPendingIntent)
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

    private fun pendingIntentFlags(): Int {
        var flags = PendingIntent.FLAG_UPDATE_CURRENT
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            flags = flags or PendingIntent.FLAG_MUTABLE
        }
        return flags
    }

    companion object {
        const val ACTION_OPEN_FROM_WIDGET = "com.tercad.fingrom.ACTION_OPEN_FROM_WIDGET"
        const val EXTRA_WIDGET_ROW_TITLE = "widget_row_title"
        const val EXTRA_WIDGET_ROW_DESCRIPTION = "widget_row_description"
        const val EXTRA_WIDGET_ROW_DETAILS = "widget_row_details"
    }
}
