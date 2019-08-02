/* This is free and unencumbered software released into the public domain. */

package org.conreality.sdk;

/** Peer */
public class Peer {
  public final String id;
  public String name;
  public PeerStatus status;

  public Peer(final String id, final String name, final PeerStatus status) {
    this.id = id;
    this.name = name;
    this.status = status;
  }
}
