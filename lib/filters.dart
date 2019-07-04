/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;

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
  FilterInfo(null, "Edge detection", "Not available at present.", false), // TODO: icon
  FilterInfo(Icons.face, "Face detection", "Not available at present.", false),
  FilterInfo(Icons.face, "Face recognition", "Not available at present.", false),
  FilterInfo(null, "Object recognition", "Not available at present.", false),
  FilterInfo(null, "Object tracking", "Not available at present.", false),
];
