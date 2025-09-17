package com.example.e_logistika
import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("4901e9f8-1b63-449f-b349-f25bfaa28cb5")
    }
}