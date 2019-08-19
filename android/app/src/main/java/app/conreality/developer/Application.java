/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import androidx.annotation.CallSuper;
import com.transistorsoft.flutter.backgroundfetch.BackgroundFetchPlugin;
import com.transistorsoft.flutter.backgroundgeolocation.FLTBackgroundGeolocationPlugin;
import dev.conreality.sdk.android.ConrealitySDK;
import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;

/** Application */
public final class Application extends FlutterApplication implements PluginRegistrantCallback {
  /** Implements android.app.Application#onCreate(). */
  @CallSuper
  @Override
  public void onCreate() {
    super.onCreate();
    ConrealitySDK.init(this);
    ApplicationPlugin.setPluginRegistrant(this);
    BackgroundFetchPlugin.setPluginRegistrant(this);
    FLTBackgroundGeolocationPlugin.setPluginRegistrant(this);
  }

  /** Implements io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback#registerWith(). */
  @Override
  public void registerWith(final PluginRegistry registry) {
    GeneratedPluginRegistrant.registerWith(registry);
    ApplicationPlugin.registerWith(registry);
  }
}
