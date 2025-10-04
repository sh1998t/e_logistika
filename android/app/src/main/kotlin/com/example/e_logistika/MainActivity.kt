package com.example.e_logistika

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
    
    override fun onStop() {
        MapKitFactory.getInstance().onStop()
        super.onStop()
    }
    
    override fun onStart() {
        super.onStart()
        MapKitFactory.getInstance().onStart()
    }
}
