/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;

////////////////////////////////////////////////////////////////////////////////

class ScriptInfo {
  final IconData icon;
  final String label;
  final String summary;
  final bool isRunning;

  const ScriptInfo(this.icon, this.label, this.summary, this.isRunning);
}

////////////////////////////////////////////////////////////////////////////////

final List<ScriptInfo> scripts = const <ScriptInfo>[
];
