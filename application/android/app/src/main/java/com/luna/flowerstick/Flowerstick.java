package com.luna.flowerstick;

import android.os.Bundle;

import in.jvapps.system_alert_window.SystemAlertWindowPlugin;
import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class Flowerstick extends FlutterApplication implements PluginRegistry.PluginRegistrantCallback {

    @Override
    public void onCreate() {
        super.onCreate();
        //This is required as we are using background channel for dispatching click events
        SystemAlertWindowPlugin.setPluginRegistrant(this);
    }

    @Override
    public void registerWith(PluginRegistry pluginRegistry) {
        GeneratedPluginRegistrant.registerWith(pluginRegistry);
    }

}