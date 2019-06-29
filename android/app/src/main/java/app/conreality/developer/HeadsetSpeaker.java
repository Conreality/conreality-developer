/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import android.content.Context;
import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import java.util.UUID;

/** HeadsetSpeaker */
final class HeadsetSpeaker implements Headset {
  private final TextToSpeech.OnInitListener onInitListener =
    new TextToSpeech.OnInitListener() {
      @Override
      public void onInit(final int status) {
        if (status != TextToSpeech.SUCCESS) {
          // TODO: error handling
        }
      }
    };
  private final TextToSpeech tts;
  private final Bundle params;
  private UUID utteranceID;

  public HeadsetSpeaker(final Context context) {
    this.tts = new TextToSpeech(context, onInitListener, "com.google.android.tts");
    this.params = new Bundle();
  }

  @Override
  public void speak(final String message) {
    this.utteranceID = UUID.randomUUID();
    System.out.printf(">>> %s [%s]", message, this.utteranceID.toString()); // TODO

    // See: https://developer.android.com/reference/android/speech/tts/TextToSpeech.html#speak(java.lang.CharSequence,%2520int,%2520android.os.Bundle,%2520java.lang.String)
    final int result = this.tts.speak(message, TextToSpeech.QUEUE_FLUSH, this.params, this.utteranceID.toString());
    if (result != TextToSpeech.SUCCESS) {
      // TODO: error handling
    }
  }
}
