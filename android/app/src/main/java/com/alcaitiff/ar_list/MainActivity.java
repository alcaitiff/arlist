package com.alcaitiff.ar_list;

import android.content.Intent;
import android.os.Bundle;
import java.util.HashMap;
import java.util.Map;
import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private Map<String, String> sharedData = new HashMap();
  private static final String CHANNEL = "app.channel.shared.data";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    Intent intent = getIntent();
    String action = intent.getAction();
    String type = intent.getType();
    handleSendIntent(intent); 
  }

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
      GeneratedPluginRegistrant.registerWith(flutterEngine);
      new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
              .setMethodCallHandler(
                      (call, result) -> {
                          if (call.method.contentEquals("getSharedData")) {
                              result.success(sharedData);
                              sharedData.clear();
                          }
                      }
              );
  }

  @Override
  protected void onNewIntent(Intent intent) {
    super.onNewIntent(intent);
    handleSendIntent(intent);
  }

  private void handleSendIntent(Intent intent) {
    String action = intent.getAction();
    String type = intent.getType();

    sharedData.put("subject", intent.getStringExtra(Intent.EXTRA_SUBJECT));
    sharedData.put("text", intent.getStringExtra(Intent.EXTRA_TEXT));
    sharedData.put("data", intent.getDataString());
  }

}