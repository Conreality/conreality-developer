/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

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
  PluginInfo(MdiIcons.headset, "Headset", "0.0.1"), // TODO: icon
];
