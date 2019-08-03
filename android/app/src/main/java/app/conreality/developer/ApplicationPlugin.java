/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import android.Manifest;
import android.content.pm.PackageManager;
import android.util.Log;
import androidx.annotation.NonNull;
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
import org.conreality.sdk.PeerMesh;
import org.conreality.sdk.PeerRegistry;
import org.conreality.sdk.PeerStatus;

/** ApplicationPlugin */
public final class ApplicationPlugin extends FlutterMethodCallHandler implements DefaultLifecycleObserver {
  private static final String TAG = "ConrealityDeveloper";
  public static final String CHANNEL = "app.conreality/developer";

  private static PluginRegistrantCallback pluginRegistrantCallback;
  private long threadID;
  private PeerMesh peerMesh;

  static void setPluginRegistrant(final @NonNull PluginRegistrantCallback callback) {
    pluginRegistrantCallback = callback;
  }

  ApplicationPlugin(final @NonNull Registrar registrar) {
    super(registrar);
    this.peerMesh = new PeerMesh(registrar.context());
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
        for (final Peer peer : this.peerMesh.registry.toList()) {
          final Map<String, Object> peerInfo = new HashMap<String, Object>();
          peerInfo.put("id", peer.id);
          peerInfo.put("name", peer.name);
          peerInfo.put("status", peer.status.ordinal());
          peers.add(peerInfo);
        }
        result.success(peers);
        break;
      }

      case "PeerMesh.requestPermissions": {
        result.success(this.requestPermissions());
        break;
      }

      case "PeerMesh.start": {
        this.peerMesh.start();
        result.success(true);
        break;
      }

      case "PeerMesh.stop": {
        this.peerMesh.stop();
        result.success(true);
        break;
      }

      case "PeerMesh.startAdvertising": {
        this.peerMesh.startAdvertising();
        result.success(true);
        break;
      }

      case "PeerMesh.stopAdvertising": {
        this.peerMesh.stopAdvertising();
        result.success(true);
        break;
      }

      case "PeerMesh.startDiscovery": {
        this.peerMesh.startDiscovery();
        result.success(true);
        break;
      }

      case "PeerMesh.stopDiscovery": {
        this.peerMesh.stopDiscovery();
        result.success(true);
        break;
      }

      default: {
        result.notImplemented();
      }
    }
  }

  boolean requestPermissions() {
    // Request the permission for location access:
    if (ContextCompat.checkSelfPermission(this.registrar.activity(), Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
      ActivityCompat.requestPermissions(this.registrar.activity(), new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 0); // TODO: handle the callback
    }
    return true;
  }
}
