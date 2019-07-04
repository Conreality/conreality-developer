/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;

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
  PluginInfo(null, "Headset", ""), // TODO: icon
];
