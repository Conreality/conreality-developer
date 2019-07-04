/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

////////////////////////////////////////////////////////////////////////////////

class SensorInfo {
  final IconData icon;
  final String label;
  final String summary;
  final bool isPresent;

  const SensorInfo(this.icon, this.label, this.summary, this.isPresent);
}

////////////////////////////////////////////////////////////////////////////////

final List<SensorInfo> sensors = const <SensorInfo>[
  SensorInfo(MdiIcons.microphone, "Audio", "Using the built-in microphone.", true),
  SensorInfo(MdiIcons.battery, "Battery", "Using the built-in battery meter.", true),
  SensorInfo(MdiIcons.compassOutline, "Compass", "Using the built-in magnetometer.", true),
  SensorInfo(MdiIcons.crosshairsGps, "GPS", "Using the built-in GPS receiver.", true),
  SensorInfo(MdiIcons.heartPulse, "Heartrate", "A heart-rate strap or smartband.", false), // TODO: icon
  SensorInfo(MdiIcons.waterPercent, "Humidity", "Not available.", false), // TODO: icon, present?
  SensorInfo(MdiIcons.motionSensor, "Motion", "Using the built-in accelerometer.", true),
  SensorInfo(MdiIcons.nfcVariant, "NFC", "Using the built-in NFC reader.", true), // TODO: present?
  SensorInfo(MdiIcons.temperatureCelsius, "Temperature", "Not available.", false), // TODO: icon, present?
  SensorInfo(MdiIcons.video, "Video", "Using the built-in camera.", true),
];
