/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show IconData;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

import 'plugins/headset_screen.dart';

////////////////////////////////////////////////////////////////////////////////

class PluginInfo {
  final IconData icon;
  final String label;
  final String summary;

  const PluginInfo(this.icon, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<PluginInfo> plugins = const <PluginInfo>[
  PluginInfo(ConrealityIcons.headset, "Headset", "0.0.1"), // TODO: icon
];
