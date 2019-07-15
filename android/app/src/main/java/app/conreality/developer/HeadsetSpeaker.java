/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import androidx.annotation.NonNull;

/** HeadsetSpeaker */
final class HeadsetSpeaker implements Headset {
  private static final String TAG = "ConrealityDeveloper";
  private static final String SERVICE_CLASS = "app.conreality.plugins.headset.HeadsetService";

  private final @NonNull Context context;
  private final @NonNull Intent intent;

  public HeadsetSpeaker(final @NonNull Context context) {
    assert(context != null);

    if (Log.isLoggable(TAG, Log.DEBUG)) {
      Log.d(TAG, String.format("Resolving the headset service class %s...", SERVICE_CLASS));
    }

    Class serviceClass;
    try {
      serviceClass = Class.forName(SERVICE_CLASS);
    }
    catch (final ClassNotFoundException error) {
      throw new RuntimeException(error);
    }

    this.context = context;
    this.intent = new Intent(context, serviceClass);
  }

  @Override
  public void speak(final @NonNull String message) {
    assert(message != null);

    if (Log.isLoggable(TAG, Log.INFO)) {
      Log.i(TAG, String.format("Speaking into the headset: \"%s\"", message));
    }

    final Intent intent = this.makeIntent("speak").putExtra("message", message);
    if (this.context.startService(intent) == null) {
      Log.e(TAG, "Failed to invoke the headset service.");
    }
  }

  private Intent makeIntent(final @NonNull String action) {
    assert(action != null);

    return this.intent.cloneFilter().setAction("speak");
  }
}
