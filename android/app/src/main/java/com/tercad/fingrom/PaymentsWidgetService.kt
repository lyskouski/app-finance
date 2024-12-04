package com.tercad.fingrom

import android.content.Intent
import android.widget.RemoteViewsService

class PaymentsWidgetService : RemoteViewsService() {
    override fun onGetViewFactory(intent: Intent): RemoteViewsFactory {
        return PaymentsWidgetFactory(applicationContext, intent)
    }
}
