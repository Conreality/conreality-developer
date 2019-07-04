/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

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
  FilterInfo(MdiIcons.vectorPolyline, "Edge detection", "Not available at present.", false), // TODO: better icon?
  FilterInfo(MdiIcons.face, "Face detection", "Not available at present.", false),
  FilterInfo(MdiIcons.faceRecognition, "Face recognition", "Not available at present.", false),
  FilterInfo(MdiIcons.vectorEllipse, "Object recognition", "Not available at present.", false), // TODO: better icon?
  FilterInfo(MdiIcons.goKartTrack, "Object tracking", "Not available at present.", false),
];
