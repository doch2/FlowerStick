package com.luna.flowerstick;

import android.os.Build;
import android.os.Bundle;
import android.content.Intent;
import android.content.ComponentName;

import androidx.annotation.NonNull;

import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        final MethodChannel channel = new MethodChannel(flutterEngine.getDartExecutor(), "com.luna.flowerstick.methodchannel");
        channel.setMethodCallHandler(handler);
    }

    private MethodChannel.MethodCallHandler handler = (methodCall, result) -> {
        if (methodCall.method.equals("openBaeMinApp")) {
            ComponentName compName = new ComponentName("com.sampleapp");
            Intent intent = new Intent(Intent.ACTION_MAIN);
            intent.setComponent(compName);
            startActivity(intent);
            result.success("success");
        } else {
            result.notImplemented();
        }
    };
}
