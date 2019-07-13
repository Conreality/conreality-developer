/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show IconData;
import 'package:conreality_beacon/conreality_beacon.dart' show ConrealityBeacon;
import 'package:conreality_headset/conreality_headset.dart' show ConrealityHeadset;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;
import 'package:conreality_pulse/conreality_pulse.dart' show ConrealityPulse;
import 'package:conreality_scripts/conreality_scripts.dart' show ConrealityScripts;

import 'plugins/beacon_screen.dart' show BeaconScreen;
import 'plugins/headset_screen.dart' show HeadsetScreen;
import 'plugins/pulse_screen.dart' show PulseScreen;
import 'scripts_screen.dart' show ScriptsScreen;

////////////////////////////////////////////////////////////////////////////////

class PluginInfo {
  final IconData icon;
  final String route;
  final String label;
  final String summary;

  const PluginInfo(this.icon, this.route, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<PluginInfo> plugins = <PluginInfo>[
  PluginInfo(ConrealityIcons.beacon, BeaconScreen.route, "Beacon", ConrealityBeacon.version),
  PluginInfo(ConrealityIcons.headset, HeadsetScreen.route, "Headset", ConrealityHeadset.version),
  PluginInfo(ConrealityIcons.pulse, PulseScreen.route, "Pulse", ConrealityPulse.version),
  PluginInfo(ConrealityIcons.script, ScriptsScreen.route, "Scripts", ConrealityScripts.version),
];
