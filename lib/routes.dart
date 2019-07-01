/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show WidgetBuilder;

import 'dosimeter_screen.dart' show DosimeterScreen;
import 'script_screen.dart' show ScriptScreen;

////////////////////////////////////////////////////////////////////////////////

Map<String, WidgetBuilder> appRoutes = {
  DosimeterScreen.route: (context) => DosimeterScreen(),
  ScriptScreen.route: (context) => ScriptScreen(),
};
