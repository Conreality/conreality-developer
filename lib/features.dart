/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show IconData;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

import 'features/chat_feature.dart' show ChatFeature;

////////////////////////////////////////////////////////////////////////////////

class FeatureInfo {
  final IconData icon;
  final String route;
  final String label;
  final String summary;

  const FeatureInfo(this.icon, this.route, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<FeatureInfo> features = <FeatureInfo>[
  FeatureInfo(ConrealityIcons.chat, ChatFeature.route, "Chat locally", "Chat with others on the local Wi-Fi network."),
];
