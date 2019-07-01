/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;

import com.transistorsoft.flutter.backgroundfetch.BackgroundFetchPlugin;
import com.transistorsoft.flutter.backgroundgeolocation.FLTBackgroundGeolocationPlugin;

public class Application extends FlutterApplication implements PluginRegistrantCallback {
  @Override
  public void onCreate() {
    super.onCreate();
    ApplicationPlugin.setPluginRegistrant(this);
    BackgroundFetchPlugin.setPluginRegistrant(this);
    FLTBackgroundGeolocationPlugin.setPluginRegistrant(this);
  }

  @Override
  public void registerWith(final PluginRegistry registry) {
    GeneratedPluginRegistrant.registerWith(registry);
    ApplicationPlugin.registerWith(registry);
  }
}
