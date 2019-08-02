/* This is free and unencumbered software released into the public domain. */

package app.conreality.developer;

import android.Manifest;
import android.content.pm.PackageManager;
import android.util.Log;
import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.lifecycle.DefaultLifecycleObserver;
import com.google.android.gms.nearby.Nearby;
import com.google.android.gms.nearby.connection.AdvertisingOptions;
import com.google.android.gms.nearby.connection.ConnectionInfo;
import com.google.android.gms.nearby.connection.ConnectionLifecycleCallback;
import com.google.android.gms.nearby.connection.ConnectionResolution;
import com.google.android.gms.nearby.connection.ConnectionsClient;
import com.google.android.gms.nearby.connection.ConnectionsStatusCodes;
import com.google.android.gms.nearby.connection.DiscoveredEndpointInfo;
import com.google.android.gms.nearby.connection.DiscoveryOptions;
import com.google.android.gms.nearby.connection.EndpointDiscoveryCallback;
import com.google.android.gms.nearby.connection.Payload;
import com.google.android.gms.nearby.connection.PayloadCallback;
import com.google.android.gms.nearby.connection.PayloadTransferUpdate;
import com.google.android.gms.nearby.connection.Strategy;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
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
import java.util.Random;
import org.conreality.sdk.Peer;
import org.conreality.sdk.PeerStatus;

/** ApplicationPlugin */
public final class ApplicationPlugin extends FlutterMethodCallHandler implements DefaultLifecycleObserver {
  private static final String TAG = "ConrealityDeveloper";
  public static final String CHANNEL = "app.conreality/developer";
  private static final Strategy P2P_STRATEGY = Strategy.P2P_CLUSTER;
  private static final String P2P_SERVICE = "app.conreality";
  private static final String P2P_NICKNAME = "Player #" + (new Random()).nextInt(100);

  private static PluginRegistrantCallback pluginRegistrantCallback;
  private long threadID;
  private Map<String, Peer> peers = new HashMap<String, Peer>();

  static void setPluginRegistrant(final @NonNull PluginRegistrantCallback callback) {
    pluginRegistrantCallback = callback;
  }

  ApplicationPlugin(final @NonNull Registrar registrar) {
    super(registrar);
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

      case "getVersion": {
        result.success(Developer.version());
        break;
      }

      case "getPeers": {
        final List<Map<String, Object>> peers = new ArrayList<Map<String, Object>>();
        for (final Map.Entry<String, Peer> entry : this.peers.entrySet()) {
          final Peer peer = entry.getValue();
          final Map<String, Object> peerInfo = new HashMap<String, Object>();
          peerInfo.put("id", peer.id);
          peerInfo.put("name", peer.name);
          peerInfo.put("status", peer.status.ordinal());
          peers.add(peerInfo);
        }
        result.success(peers);
        break;
      }

      case "spawnThread": {
        this.threadID++;
        new ScriptThreadHandler(this.registrar, this.threadID);
        result.success(this.threadID);
        break;
      }

      case "requestPermissions": {
        result.success(this.requestPermissions());
        break;
      }

      case "start": {
        result.success(this.start());
        break;
      }

      case "stop": {
        result.success(this.stop());
        break;
      }

      case "startAdvertising": {
        result.success(this.startAdvertising());
        break;
      }

      case "stopAdvertising": {
        result.success(this.stopAdvertising());
        break;
      }

      case "startDiscovery": {
        result.success(this.startDiscovery());
        break;
      }

      case "stopDiscovery": {
        result.success(this.stopDiscovery());
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

  boolean start() {
    boolean result = true;
    result = this.requestPermissions() && result;
    result = this.startAdvertising() && result;
    result = this.startDiscovery() && result;
    return result;
  }

  boolean stop() {
    boolean result = true;
    result = this.stopAdvertising() && result;
    result = this.stopDiscovery() && result;
    return result;
  }

  boolean startAdvertising() {
    final AdvertisingOptions.Builder advertisingOptions =
        new AdvertisingOptions.Builder()
            .setStrategy(P2P_STRATEGY);

    this.nearbyConnections()
        .startAdvertising(P2P_NICKNAME, P2P_SERVICE, connectionLifecycle, advertisingOptions.build()) // TODO: nickname
        .addOnSuccessListener(
            new OnSuccessListener<Void>() {
              @Override
              public void onSuccess(final Void _unused) {
                Log.d(TAG, "startAdvertising.onSuccess");
              }
            }
        )
        .addOnFailureListener(
            new OnFailureListener() {
              @Override
              public void onFailure(final @NonNull Exception e) {
                Log.e(TAG, "startAdvertising.onFailure", e);
              }
            });

    return true;
  }

  boolean stopAdvertising() {
    this.nearbyConnections().stopAdvertising();
    return true;
  }

  boolean startDiscovery() {
    final DiscoveryOptions.Builder discoveryOptions =
        new DiscoveryOptions.Builder()
            .setStrategy(P2P_STRATEGY);

    this.nearbyConnections()
        .startDiscovery(P2P_SERVICE, endpointDiscovery, discoveryOptions.build())
        .addOnSuccessListener(
            new OnSuccessListener<Void>() {
              @Override
              public void onSuccess(final Void _unused) {
                Log.d(TAG, "startDiscovery.onSuccess");
              }
            }
        )
        .addOnFailureListener(
            new OnFailureListener() {
              @Override
              public void onFailure(final @NonNull Exception e) {
                Log.e(TAG, "startDiscovery.onFailure", e);
              }
            });

    return true;
  }

  boolean stopDiscovery() {
    this.nearbyConnections().stopDiscovery();
    return true;
  }

  // See: https://developers.google.com/android/reference/com/google/android/gms/nearby/connection/ConnectionsClient
  private @NonNull ConnectionsClient nearbyConnections() {
    return Nearby.getConnectionsClient(this.registrar.context());
  }

  // See: https://developers.google.com/android/reference/com/google/android/gms/nearby/connection/EndpointDiscoveryCallback
  private final EndpointDiscoveryCallback endpointDiscovery = new EndpointDiscoveryCallback() {
    @Override
    public void onEndpointFound(final @NonNull String endpointId, final DiscoveredEndpointInfo info) {
      Log.d(TAG, String.format("EndpointDiscoveryCallback.onEndpointFound: endpointId=%s serviceId=%s endpointName=%s", endpointId, info.getServiceId(), info.getEndpointName()));
      peers.putIfAbsent(endpointId, new Peer(endpointId, info.getEndpointName(), PeerStatus.Discovered));

      nearbyConnections()
          .requestConnection(P2P_NICKNAME, endpointId, connectionLifecycle) // TODO: nickname
          .addOnSuccessListener(
            new OnSuccessListener<Void>() {
              @Override
              public void onSuccess(final Void _unused) {
                Log.d(TAG, "requestConnection.onSuccess");
                peers.compute(endpointId, (peerID, peer) -> {
                  if (peer != null) {
                    peer.status = PeerStatus.Connecting;
                  }
                  return peer;
                });
              }
            }
        )
        .addOnFailureListener(
            new OnFailureListener() {
              @Override
              public void onFailure(final @NonNull Exception e) {
                Log.e(TAG, "requestConnection.onFailure", e);
              }
            });
    }

    @Override
    public void onEndpointLost(final @NonNull String endpointId) {
      Log.d(TAG, String.format("EndpointDiscoveryCallback.onEndpointLost: endpointId=%s", endpointId));

      peers.compute(endpointId, (peerID, peer) -> {
        if (peer != null) {
          peer.status = PeerStatus.Lost;
        }
        return peer;
      });
    }
  };

  // See: https://developers.google.com/android/reference/com/google/android/gms/nearby/connection/ConnectionLifecycleCallback
  private final ConnectionLifecycleCallback connectionLifecycle = new ConnectionLifecycleCallback() {
    // A basic encrypted channel has been created between you and the endpoint.
    // Both sides are now asked if they wish to accept or reject the connection
    // before any data can be sent over this channel.
    @Override
    public void onConnectionInitiated(final @NonNull String endpointId, final ConnectionInfo info) {
      Log.d(TAG, String.format("ConnectionLifecycleCallback.onConnectionInitiated: endpointId=%s endpointName=%s", endpointId, info.getEndpointName()));
      nearbyConnections().acceptConnection(endpointId, payloadCallback); // automatically accept the connection
      peers.compute(endpointId, (peerID, peer) -> {
        if (peer != null) {
          peer.name = info.getEndpointName();
          peer.status = PeerStatus.Connecting;
        }
        return peer;
      });
    }

    // Called after both sides have either accepted or rejected the connection.
    @Override
    public void onConnectionResult(final @NonNull String endpointId, final ConnectionResolution result) {
      Log.d(TAG, String.format("ConnectionLifecycleCallback.onConnectionResult: endpointId=%s result=%d", endpointId, result.getStatus().getStatusCode()));
      peers.compute(endpointId, (peerID, peer) -> {
        if (peer != null) {
          peer.status = PeerStatus.fromStatus(result.getStatus());
        }
        return peer;
      });
    }

    // Called when a remote endpoint is disconnected or has become unreachable.
    @Override
    public void onDisconnected(final @NonNull String endpointId) {
      Log.w(TAG, String.format("ConnectionLifecycleCallback.onDisconnected: endpointId=%s", endpointId));
      peers.compute(endpointId, (peerID, peer) -> {
        if (peer != null) {
          peer.status = PeerStatus.Disconnected;
        }
        return peer;
      });
    }
  };

  // See: https://developers.google.com/android/reference/com/google/android/gms/nearby/connection/PayloadCallback
  private final PayloadCallback payloadCallback = new PayloadCallback() {
    @Override
    public void onPayloadReceived(final @NonNull String endpointId, final Payload payload) {
      Log.d(TAG, String.format("PayloadCallback.onPayloadReceived: endpointId=%s payload=%s", endpointId, payload));
    }

    @Override
    public void onPayloadTransferUpdate(final @NonNull String endpointId, final PayloadTransferUpdate update) {
      Log.d(TAG, String.format("PayloadCallback.onPayloadTransferUpdate: endpointId=%s update=%s", endpointId, update));
    }
  };
}
