/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show WidgetBuilder;

import 'filters_screen.dart' show FiltersScreen;
import 'plugins_screen.dart' show PluginsScreen;
import 'sensors_screen.dart' show SensorsScreen;
import 'scripts_screen.dart' show ScriptsScreen;
import 'widgets_screen.dart' show WidgetsScreen;

import 'widgets/camera_screen.dart' show CameraScreen;
import 'widgets/chat_screen.dart' show ChatScreen;
import 'widgets/compass_screen.dart' show CompassScreen;
import 'widgets/dosimeter_screen.dart' show DosimeterScreen;
import 'widgets/login_screen.dart' show LoginScreen;
import 'widgets/map_screen.dart' show MapScreen;
import 'widgets/replay_screen.dart' show ReplayScreen;
import 'widgets/tracker_screen.dart' show TrackerScreen;

////////////////////////////////////////////////////////////////////////////////

Map<String, WidgetBuilder> appRoutes = {
  // Drawer
  FiltersScreen.route: (_) => FiltersScreen(),
  PluginsScreen.route: (_) => PluginsScreen(),
  SensorsScreen.route: (_) => SensorsScreen(),
  ScriptsScreen.route: (_) => ScriptsScreen(),
  WidgetsScreen.route: (_) => WidgetsScreen(),
  // Widgets
  CameraScreen.route: (_) => CameraScreen(),
  ChatScreen.route: (_) => ChatScreen(),
  CompassScreen.route: (_) => CompassScreen(),
  DosimeterScreen.route: (_) => DosimeterScreen(),
  LoginScreen.route: (_) => LoginScreen(),
  MapScreen.route: (_) => MapScreen(),
  ReplayScreen.route: (_) => ReplayScreen(),
  TrackerScreen.route: (_) => TrackerScreen(),
};
