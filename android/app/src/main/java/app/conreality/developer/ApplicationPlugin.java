/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import android.Manifest;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.IBinder;
import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.lifecycle.DefaultLifecycleObserver;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//import java.util.Random;
import org.conreality.sdk.Peer;
import org.conreality.sdk.PeerService;

/** ApplicationPlugin */
public final class ApplicationPlugin extends FlutterMethodCallHandler implements DefaultLifecycleObserver, ServiceConnection {
  private static final String TAG = "ConrealityDeveloper";
  public static final String CHANNEL = "app.conreality/developer";

  private static PluginRegistrantCallback pluginRegistrantCallback;
  private long threadID;
  private @Nullable PeerService peerService;

  static void setPluginRegistrant(final @NonNull PluginRegistrantCallback callback) {
    pluginRegistrantCallback = callback;
  }

  /** Plugin registration. */
  public static void registerWith(final @NonNull PluginRegistry registry) {
    assert(registry != null);

    final String key = ApplicationPlugin.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return; // already registered with the registry
    }
    registerWith(registry.registrarFor(key));
  }

  /** Plugin registration. */
  public static void registerWith(final @NonNull Registrar registrar) {
    assert(registrar != null);

    (new MethodChannel(registrar.messenger(), CHANNEL))
      .setMethodCallHandler(new ApplicationPlugin(registrar));
  }

  ApplicationPlugin(final @NonNull Registrar registrar) {
    super(registrar);
    final @NonNull Context context = registrar.context();
    final boolean ok = context.bindService(new Intent(context, PeerService.class), this, Context.BIND_AUTO_CREATE);
    if (!ok) {
      Log.e(TAG, "Failed to connect to the bound service.");
      context.unbindService(this);
    }
  }

  /** Implements ServiceConnection#onServiceConnected(). */
  @Override
  public void onServiceConnected(final @NonNull ComponentName name, final @NonNull IBinder service) {
    assert(name != null);
    assert(service != null);

    Log.d(TAG, String.format("onServiceConnected: name=%s service=%s", name, service));
    this.peerService = ((PeerService.LocalBinder)service).getService();
    this.peerService.onConnection(this.registrar.context());
  }

  /** Implements ServiceConnection#onServiceDisconnected(). */
  @Override
  public void onServiceDisconnected(final @NonNull ComponentName name) {
    assert(name != null);

    Log.d(TAG, String.format("onServiceDisconnected: name=%s", name));
    this.peerService = null;
  }

  /** Implements MethodCallHandler#onMethodCall(). */
  @Override
  public void onMethodCall(final @NonNull MethodCall call, final @NonNull Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {

      case "GDK.getVersion": {
        result.success(Developer.version());
        break;
      }

      case "GDK.spawnThread": {
        this.threadID++;
        new ScriptThreadHandler(this.registrar, this.threadID);
        result.success(this.threadID);
        break;
      }

      case "PeerMesh.getPeers": {
        final List<Map<String, Object>> peers = new ArrayList<Map<String, Object>>();
        if (this.peerService != null) {
          for (final Peer peer : this.peerService.getPeers()) {
            final Map<String, Object> peerInfo = new HashMap<String, Object>();
            peerInfo.put("id", peer.id);
            peerInfo.put("name", peer.name);
            peerInfo.put("status", peer.status.ordinal());
            peers.add(peerInfo);
          }
        }
        result.success(peers);
        break;
      }

      case "PeerMesh.requestPermissions": {
        result.success(this.requestPermissions());
        break;
      }

      case "PeerMesh.start": {
        if (this.peerService != null) {
          this.peerService.start();
          result.success(true);
        }
        else {
          result.success(false);
        }
        break;
      }

      case "PeerMesh.stop": {
        if (this.peerService != null) {
          this.peerService.stop();
          result.success(true);
        }
        else {
          result.success(false);
        }
        break;
      }

      case "PeerMesh.startAdvertising": {
        //this.peerService.startAdvertising();
        result.success(true);
        break;
      }

      case "PeerMesh.stopAdvertising": {
        //this.peerService.stopAdvertising();
        result.success(true);
        break;
      }

      case "PeerMesh.startDiscovery": {
        //this.peerService.startDiscovery();
        result.success(true);
        break;
      }

      case "PeerMesh.stopDiscovery": {
        //this.peerService.stopDiscovery();
        result.success(true);
        break;
      }

      default: {
        result.notImplemented();
      }
    }
  }

  protected boolean requestPermissions() {
    // Request the permission for location access:
    if (ContextCompat.checkSelfPermission(this.registrar.activity(), Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
      ActivityCompat.requestPermissions(this.registrar.activity(), new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 0); // TODO: handle the callback
    }
    return true;
  }
}
