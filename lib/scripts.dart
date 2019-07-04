/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;

import 'package:conreality_scripts/conreality_scripts.dart' show Scripts;

////////////////////////////////////////////////////////////////////////////////

class ScriptInfo {
  final IconData icon;
  final String label;
  final String summary;
  final bool isRunning;

  const ScriptInfo(this.icon, this.label, this.summary, this.isRunning);
}

////////////////////////////////////////////////////////////////////////////////

final List<ScriptInfo> scripts = Scripts.all.keys.map((path) {
  return ScriptInfo(null, path, path, false); // TODO
}).toList();
