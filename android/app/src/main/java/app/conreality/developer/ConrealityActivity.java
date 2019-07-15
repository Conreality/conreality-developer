/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import android.os.Bundle;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleRegistry;
import io.flutter.app.FlutterActivity;

/** ConrealityActivity */
public class ConrealityActivity extends FlutterActivity implements LifecycleOwner {
  protected final LifecycleRegistry lifecycleRegistry;

  public ConrealityActivity() {
    super();
    this.lifecycleRegistry = new LifecycleRegistry(this);
  }

  /** Implements Activity#onCreate(). */
  @Override
  protected void onCreate(final Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    this.lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_CREATE);
  }

  /** Implements Activity#onStart(). */
  @Override
  protected void onStart() {
    super.onStart();
    this.lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_START);
  }

  /** Implements Activity#onRestart(). */
  @Override
  protected void onRestart() {
    super.onRestart();
    // always followed by onStart()
  }

  /** Implements Activity#onResume(). */
  @Override
  protected void onResume() {
    super.onResume();
    this.lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_RESUME);
  }

  /** Implements Activity#onPause(). */
  @Override
  protected void onPause() {
    super.onPause();
    this.lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_PAUSE);
  }

  /** Implements Activity#onStop(). */
  @Override
  protected void onStop() {
    super.onStop();
    this.lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_STOP);
  }

  /** Implements Activity#onDestroy(). */
  @Override
  protected void onDestroy() {
    super.onDestroy();
    this.lifecycleRegistry.handleLifecycleEvent(Lifecycle.Event.ON_DESTROY);
  }

  /** Implements LifecycleOwner#getLifecycle(). */
  @Override
  public Lifecycle getLifecycle() {
    return new Lifecycle() {
      public Lifecycle.State getCurrentState() {
        return lifecycleRegistry.getCurrentState();
      }
      public void addObserver(final LifecycleObserver observer) {
        lifecycleRegistry.addObserver(observer);
      }
      public void removeObserver(final LifecycleObserver observer) {
        lifecycleRegistry.removeObserver(observer);
      }
    };
  }
}
