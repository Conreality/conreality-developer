/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;

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
  SensorInfo(Icons.mic, "Audio", "Using the built-in microphone.", true),
  SensorInfo(Icons.battery_std, "Battery", "Using the built-in battery meter.", true),
  SensorInfo(Icons.navigation, "Compass", "Using the built-in magnetometer.", true),
  SensorInfo(Icons.gps_fixed, "GPS", "Using the built-in GPS receiver.", true),
  SensorInfo(null, "Heartrate", "A heart-rate strap or smartband.", false), // TODO: icon
  SensorInfo(null, "Humidity", "Not available.", false), // TODO: icon, present?
  SensorInfo(Icons.directions_walk, "Motion", "Using the built-in accelerometer.", true),
  SensorInfo(Icons.nfc, "NFC", "Using the built-in NFC reader.", true), // TODO: present?
  SensorInfo(null, "Temperature", "Not available.", false), // TODO: icon, present?
  SensorInfo(Icons.camera, "Video", "Using the built-in camera.", true),
];
