/* This is free and unencumbered software released into the public domain. */

package org.conreality.sdk;

import android.content.Context;
import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
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
import java.util.Random;

/** PeerDiscovery */
public class PeerDiscovery {
  private static final String TAG = "PeerDiscovery";
  private static final Strategy P2P_STRATEGY = Strategy.P2P_CLUSTER;
  private static final String P2P_SERVICE = "app.conreality";
  private static final String P2P_NICKNAME = "Player #" + (new Random()).nextInt(100); // FIXME

  private final ConnectionsClient nearbyConnections;
  private final PeerRegistry peerRegistry;

  public PeerDiscovery(final @NonNull Context context) {
    this(context, null);
  }

  public PeerDiscovery(final @NonNull Context context,
                       final @Nullable PeerRegistry peerRegistry) {
    this.nearbyConnections = Nearby.getConnectionsClient(context);
    this.peerRegistry = (peerRegistry != null) ? peerRegistry : new PeerRegistry();
  }

  public void start() {
    this.startDiscovery();
    this.startAdvertising();
  }

  public void stop() {
    this.stopAdvertising();
    this.stopDiscovery();
  }

  public void startAdvertising() {
    final AdvertisingOptions.Builder advertisingOptions =
        new AdvertisingOptions.Builder()
            .setStrategy(P2P_STRATEGY);

    this.nearbyConnections
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
  }

  public void startDiscovery() {
    final DiscoveryOptions.Builder discoveryOptions =
        new DiscoveryOptions.Builder()
            .setStrategy(P2P_STRATEGY);

    this.nearbyConnections
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
  }

  public void stopAdvertising() {
    this.nearbyConnections.stopAdvertising();
  }

  public void stopDiscovery() {
    this.nearbyConnections.stopDiscovery();
  }

  protected void requestConnection(final @NonNull String endpointId) {
    this.nearbyConnections
        .requestConnection(P2P_NICKNAME, endpointId, connectionLifecycle) // TODO: nickname
        .addOnSuccessListener(
          new OnSuccessListener<Void>() {
            @Override
            public void onSuccess(final Void _unused) {
              Log.d(TAG, "requestConnection.onSuccess");
              peerRegistry.setStatus(endpointId, PeerStatus.Connecting);
            }
          }
        )
        .addOnFailureListener(
          new OnFailureListener() {
            @Override
            public void onFailure(final @NonNull Exception e) {
              Log.e(TAG, "requestConnection.onFailure", e);
              // TODO: retry
            }
          });
  }

  // See: https://developers.google.com/android/reference/com/google/android/gms/nearby/connection/EndpointDiscoveryCallback
  private final EndpointDiscoveryCallback endpointDiscovery = new EndpointDiscoveryCallback() {
    @Override
    public void onEndpointFound(final @NonNull String endpointId, final DiscoveredEndpointInfo info) {
      Log.d(TAG, String.format("EndpointDiscoveryCallback.onEndpointFound: endpointId=%s serviceId=%s endpointName=%s", endpointId, info.getServiceId(), info.getEndpointName()));
      peerRegistry.add(new Peer(endpointId, info.getEndpointName(), PeerStatus.Discovered));
      requestConnection(endpointId);
    }

    @Override
    public void onEndpointLost(final @NonNull String endpointId) {
      Log.d(TAG, String.format("EndpointDiscoveryCallback.onEndpointLost: endpointId=%s", endpointId));
      peerRegistry.setStatus(endpointId, PeerStatus.Lost);
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
      nearbyConnections.acceptConnection(endpointId, payloadCallback); // automatically accept the connection
      peerRegistry.setStatus(endpointId, PeerStatus.Connecting);
      peerRegistry.setName(endpointId, info.getEndpointName());
    }

    // Called after both sides have either accepted or rejected the connection.
    @Override
    public void onConnectionResult(final @NonNull String endpointId, final ConnectionResolution result) {
      Log.d(TAG, String.format("ConnectionLifecycleCallback.onConnectionResult: endpointId=%s result=%d", endpointId, result.getStatus().getStatusCode()));
      peerRegistry.setStatus(endpointId, PeerStatus.fromStatus(result.getStatus()));
    }

    // Called when a remote endpoint is disconnected or has become unreachable.
    @Override
    public void onDisconnected(final @NonNull String endpointId) {
      Log.w(TAG, String.format("ConnectionLifecycleCallback.onDisconnected: endpointId=%s", endpointId));
      peerRegistry.setStatus(endpointId, PeerStatus.Disconnected);
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
