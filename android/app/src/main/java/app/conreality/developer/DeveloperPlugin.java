/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import java.io.IOException;

/** DeveloperPlugin */
public class DeveloperPlugin extends FlutterMethodCallHandler {
  private static final String TAG = "DeveloperPlugin";
  public static final String CHANNEL = "app.conreality/developer";

  private static PluginRegistrantCallback pluginRegistrantCallback;
  private long threadID;

  static void setPluginRegistrant(final PluginRegistrantCallback callback) {
    pluginRegistrantCallback = callback;
  }

  DeveloperPlugin(final Registrar registrar) {
    super(registrar);
  }

  /** Plugin registration. */
  public static void registerWith(final Registrar registrar) {
    assert(registrar != null);

    (new MethodChannel(registrar.messenger(), CHANNEL))
      .setMethodCallHandler(new DeveloperPlugin(registrar));
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
        //new ThreadHandler(this.registrar, this.threadID); // TODO
        result.success(this.threadID);
        break;
      }

      default: {
        result.notImplemented();
      }
    }
  }
}
