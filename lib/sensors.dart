/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show IconData;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

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
  SensorInfo(ConrealityIcons.microphone, "Audio", "Using the built-in microphone.", true),
  SensorInfo(ConrealityIcons.battery, "Battery", "Using the built-in battery meter.", true),
  SensorInfo(ConrealityIcons.compass, "Compass", "Using the built-in magnetometer.", true),
  SensorInfo(ConrealityIcons.gps, "GPS", "Using the built-in GPS receiver.", true),
  SensorInfo(ConrealityIcons.pulse, "Heartrate", "A heart-rate strap or smartband.", false),
  SensorInfo(ConrealityIcons.humidity, "Humidity", "Not available.", false), // TODO: present?
  SensorInfo(ConrealityIcons.motion, "Motion", "Using the built-in accelerometer.", true),
  SensorInfo(ConrealityIcons.nfc, "NFC", "Using the built-in NFC reader.", true), // TODO: present?
  SensorInfo(ConrealityIcons.temperature, "Temperature", "Not available.", false), // TODO: present?
  SensorInfo(ConrealityIcons.video, "Video", "Using the built-in camera.", true),
];
