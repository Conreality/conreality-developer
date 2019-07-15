/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import android.os.Bundle;
import androidx.annotation.Nullable;
import io.flutter.plugins.GeneratedPluginRegistrant;

/** MainActivity */
public final class MainActivity extends ConrealityActivity {

  /** Implements Activity#onCreate(). */
  @Override
  protected void onCreate(final @Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    ApplicationPlugin.registerWith(this);
  }
}
