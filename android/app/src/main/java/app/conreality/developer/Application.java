/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class Application extends FlutterApplication implements PluginRegistrantCallback {
  @Override
  public void onCreate() {
    super.onCreate();
    DeveloperPlugin.setPluginRegistrant(this);
  }

  @Override
  public void registerWith(final PluginRegistry registry) {
    GeneratedPluginRegistrant.registerWith(registry);
    //DeveloperPlugin.registerWith(registry.registrarFor("app.conreality.developer.DeveloperPlugin")); // FIXME
  }
}
