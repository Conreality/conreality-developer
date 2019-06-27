/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

/** MainActivity */
public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(final Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    (new MethodChannel(getFlutterView(), DeveloperPlugin.CHANNEL))
      .setMethodCallHandler(new DeveloperPlugin(null)); // FIXME
  }
}
