/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

/** HeadsetSpeaker */
final class HeadsetSpeaker implements Headset {
    @Override
    public void speak(final String message) {
        System.err.println(">>>>>>>>>>>>>>>>>>> " + message); // TODO
    }
}
