/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show IconData;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

////////////////////////////////////////////////////////////////////////////////

class FilterInfo {
  final IconData icon;
  final String label;
  final String summary;
  final bool isActive;

  const FilterInfo(this.icon, this.label, this.summary, this.isActive);
}

////////////////////////////////////////////////////////////////////////////////

final List<FilterInfo> filters = const <FilterInfo>[
  FilterInfo(ConrealityIcons.edgeDetection, "Edge detection", "Not available at present.", false),
  FilterInfo(ConrealityIcons.faceDetection, "Face detection", "Not available at present.", false),
  FilterInfo(ConrealityIcons.faceRecognition, "Face recognition", "Not available at present.", false),
  FilterInfo(ConrealityIcons.objectRecognition, "Object recognition", "Not available at present.", false),
  FilterInfo(ConrealityIcons.objectTracking, "Object tracking", "Not available at present.", false),
];
