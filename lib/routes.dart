/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show WidgetBuilder;

import 'dosimeter_screen.dart' show DosimeterScreen;
import 'scripts_screen.dart' show ScriptsScreen;
import 'widgets_screen.dart' show WidgetsScreen;

////////////////////////////////////////////////////////////////////////////////

Map<String, WidgetBuilder> appRoutes = {
  DosimeterScreen.route: (context) => DosimeterScreen(),
  ScriptsScreen.route: (context) => ScriptsScreen(),
  WidgetsScreen.route: (context) => WidgetsScreen(),
};
