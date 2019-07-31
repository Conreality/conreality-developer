/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show IconData;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

import 'features/chat_feature.dart' show ChatFeature;
import 'features/discover_feature.dart' show DiscoverFeature;

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
  FeatureInfo(MdiIcons.scanner, DiscoverFeature.route, "Discover peers", "Discover peers on the local Wi-Fi network."),
  FeatureInfo(ConrealityIcons.chat, ChatFeature.route, "Chat locally", "Chat with peers on the local Wi-Fi network."),
];
