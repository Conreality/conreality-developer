/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show IconData;
import 'package:conreality_headset/conreality_headset.dart' show ConrealityHeadset;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;
import 'package:conreality_pulse/conreality_pulse.dart' show ConrealityPulse;
import 'package:conreality_scripts/conreality_scripts.dart' show ConrealityScripts;

import 'plugins/headset_screen.dart';

////////////////////////////////////////////////////////////////////////////////

class PluginInfo {
  final IconData icon;
  final String label;
  final String summary;

  const PluginInfo(this.icon, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<PluginInfo> plugins = <PluginInfo>[
  PluginInfo(ConrealityIcons.headset, "Headset", ConrealityHeadset.version),
  PluginInfo(ConrealityIcons.pulse, "Pulse", ConrealityPulse.version),
  PluginInfo(ConrealityIcons.script, "Scripts", ConrealityScripts.version),
];
