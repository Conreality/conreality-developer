/* This is free and unencumbered software released into the public domain. */

package org.conreality.sdk;

import android.content.Context;
import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.google.android.gms.common.api.ApiException;
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

/** PeerMesh */
public class PeerMesh {
  private static final String TAG = "PeerMesh";
  private static final Strategy P2P_STRATEGY = Strategy.P2P_CLUSTER;
  private static final String P2P_SERVICE = "app.conreality";
  private static final String P2P_NICKNAME = "Player #" + (new Random()).nextInt(100); // FIXME

  private final ConnectionsClient nearbyConnections;
  public final PeerRegistry registry;

  public PeerMesh(final @NonNull Context context) {
    this(context, null);
  }

  public PeerMesh(final @NonNull Context context,
                  final @Nullable PeerRegistry registry) {
    this.nearbyConnections = Nearby.getConnectionsClient(context);
    this.registry = (registry != null) ? registry : new PeerRegistry();
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
              public void onFailure(final @NonNull Exception error) {
                if (error instanceof ApiException) {
                  switch (((ApiException)error).getStatusCode()) {
                    case ConnectionsStatusCodes.STATUS_ALREADY_ADVERTISING:
                      Log.w(TAG, "startAdvertising.onFailure: STATUS_ALREADY_ADVERTISING");
                      return; // nothing to do
                  }
                }
                Log.e(TAG, "startAdvertising.onFailure", error);
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
              public void onFailure(final @NonNull Exception error) {
                if (error instanceof ApiException) {
                  switch (((ApiException)error).getStatusCode()) {
                    case ConnectionsStatusCodes.STATUS_ALREADY_DISCOVERING:
                      Log.w(TAG, "startDiscovery.onFailure: STATUS_ALREADY_DISCOVERING");
                      return; // nothing to do
                  }
                }
                Log.e(TAG, "startDiscovery.onFailure", error);
              }
            });
  }

  public void stopAdvertising() {
    this.nearbyConnections.stopAdvertising();
  }

  public void stopDiscovery() {
    this.nearbyConnections.stopDiscovery();
  }

  protected void requestConnection(final @NonNull String endpointID) {
    registry.setStatus(endpointID, PeerStatus.Connecting);
    this.nearbyConnections
        .requestConnection(P2P_NICKNAME, endpointID, connectionLifecycle) // TODO: nickname
        .addOnSuccessListener(
          new OnSuccessListener<Void>() {
            @Override
            public void onSuccess(final Void _unused) {
              Log.d(TAG, "requestConnection.onSuccess");
              registry.setStatus(endpointID, PeerStatus.Connected); // FIXME?
            }
          }
        )
        .addOnFailureListener(
          new OnFailureListener() {
            @Override
            public void onFailure(final @NonNull Exception error) {
              if (error instanceof ApiException) {
                switch (((ApiException)error).getStatusCode()) {
                  case ConnectionsStatusCodes.STATUS_ALREADY_CONNECTED_TO_ENDPOINT:
                    Log.w(TAG, "requestConnection.onFailure: STATUS_ALREADY_CONNECTED_TO_ENDPOINT");
                    registry.setStatus(endpointID, PeerStatus.Connected);
                    return;
                }
              }
              Log.e(TAG, "requestConnection.onFailure", error);
              requestConnection(endpointID); // retry connecting
            }
          });
  }

  // See: https://developers.google.com/android/reference/com/google/android/gms/nearby/connection/EndpointDiscoveryCallback
  private final EndpointDiscoveryCallback endpointDiscovery = new EndpointDiscoveryCallback() {
    @Override
    public void onEndpointFound(final @NonNull String endpointID, final DiscoveredEndpointInfo info) {
      Log.d(TAG, String.format("EndpointDiscoveryCallback.onEndpointFound: endpointID=%s serviceId=%s endpointName=%s", endpointID, info.getServiceId(), info.getEndpointName()));
      registry.add(new Peer(endpointID, info.getEndpointName(), PeerStatus.Discovered));
      requestConnection(endpointID);
    }

    @Override
    public void onEndpointLost(final @NonNull String endpointID) {
      Log.d(TAG, String.format("EndpointDiscoveryCallback.onEndpointLost: endpointID=%s", endpointID));
      registry.setStatus(endpointID, PeerStatus.Lost);
    }
  };

  // See: https://developers.google.com/android/reference/com/google/android/gms/nearby/connection/ConnectionLifecycleCallback
  private final ConnectionLifecycleCallback connectionLifecycle = new ConnectionLifecycleCallback() {
    // A basic encrypted channel has been created between you and the endpoint.
    // Both sides are now asked if they wish to accept or reject the connection
    // before any data can be sent over this channel.
    @Override
    public void onConnectionInitiated(final @NonNull String endpointID, final ConnectionInfo info) {
      Log.d(TAG, String.format("ConnectionLifecycleCallback.onConnectionInitiated: endpointID=%s endpointName=%s", endpointID, info.getEndpointName()));
      nearbyConnections.acceptConnection(endpointID, payloadCallback); // automatically accept the connection
      registry.setStatus(endpointID, PeerStatus.Connecting);
      registry.setName(endpointID, info.getEndpointName());
    }

    // Called after both sides have either accepted or rejected the connection.
    @Override
    public void onConnectionResult(final @NonNull String endpointID, final ConnectionResolution result) {
      Log.d(TAG, String.format("ConnectionLifecycleCallback.onConnectionResult: endpointID=%s result=%d", endpointID, result.getStatus().getStatusCode()));
      registry.setStatus(endpointID, PeerStatus.fromStatus(result.getStatus()));
      switch (result.getStatus().getStatusCode()) {
        case ConnectionsStatusCodes.STATUS_ERROR:
          requestConnection(endpointID); // retry connecting
          break;
      }
    }

    // Called when a remote endpoint is disconnected or has become unreachable.
    @Override
    public void onDisconnected(final @NonNull String endpointID) {
      Log.w(TAG, String.format("ConnectionLifecycleCallback.onDisconnected: endpointID=%s", endpointID));
      registry.setStatus(endpointID, PeerStatus.Disconnected);
      requestConnection(endpointID); // retry connecting
    }
  };

  // See: https://developers.google.com/android/reference/com/google/android/gms/nearby/connection/PayloadCallback
  private final PayloadCallback payloadCallback = new PayloadCallback() {
    @Override
    public void onPayloadReceived(final @NonNull String endpointID, final Payload payload) {
      Log.d(TAG, String.format("PayloadCallback.onPayloadReceived: endpointID=%s payload=%s", endpointID, payload));
    }

    @Override
    public void onPayloadTransferUpdate(final @NonNull String endpointID, final PayloadTransferUpdate update) {
      Log.d(TAG, String.format("PayloadCallback.onPayloadTransferUpdate: endpointID=%s update=%s", endpointID, update));
    }
  };
}