/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import androidx.lifecycle.DefaultLifecycleObserver;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ApplicationPlugin */
public class ApplicationPlugin extends FlutterMethodCallHandler implements DefaultLifecycleObserver {
  private static final String TAG = "ApplicationPlugin";
  public static final String CHANNEL = "app.conreality/developer";

  private static PluginRegistrantCallback pluginRegistrantCallback;
  private long threadID;

  static void setPluginRegistrant(final PluginRegistrantCallback callback) {
    pluginRegistrantCallback = callback;
  }

  ApplicationPlugin(final Registrar registrar) {
    super(registrar);
  }

  /** Plugin registration. */
  public static void registerWith(final PluginRegistry registry) {
    final String key = ApplicationPlugin.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return; // already registered with the registry
    }
    registerWith(registry.registrarFor(key));
  }

  /** Plugin registration. */
  public static void registerWith(final Registrar registrar) {
    assert(registrar != null);

    (new MethodChannel(registrar.messenger(), CHANNEL))
      .setMethodCallHandler(new ApplicationPlugin(registrar));
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {

      case "getVersion": {
        result.success(Developer.version());
        break;
      }

      case "spawnThread": {
        this.threadID++;
        new ThreadHandler(this.registrar, this.threadID);
        result.success(this.threadID);
        break;
      }

      default: {
        result.notImplemented();
      }
    }
  }
}
