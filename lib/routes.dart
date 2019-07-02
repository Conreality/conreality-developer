/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show WidgetBuilder;

import 'sensors_screen.dart' show SensorsScreen;
import 'scripts_screen.dart' show ScriptsScreen;
import 'widgets_screen.dart' show WidgetsScreen;

import 'src/camera_screen.dart' show CameraScreen;
import 'src/chat_screen.dart' show ChatScreen;
import 'src/compass_screen.dart' show CompassScreen;
import 'src/dosimeter_screen.dart' show DosimeterScreen;
import 'src/login_screen.dart' show LoginScreen;
import 'src/map_screen.dart' show MapScreen;
import 'src/replay_screen.dart' show ReplayScreen;
import 'src/tracker_screen.dart' show TrackerScreen;

////////////////////////////////////////////////////////////////////////////////

Map<String, WidgetBuilder> appRoutes = {
  SensorsScreen.route: (context) => SensorsScreen(),
  ScriptsScreen.route: (context) => ScriptsScreen(),
  WidgetsScreen.route: (context) => WidgetsScreen(),

  // Widgets
  CameraScreen.route: (context) => CameraScreen(),
  ChatScreen.route: (context) => ChatScreen(),
  CompassScreen.route: (context) => CompassScreen(),
  DosimeterScreen.route: (context) => DosimeterScreen(),
  LoginScreen.route: (context) => LoginScreen(),
  MapScreen.route: (context) => MapScreen(),
  ReplayScreen.route: (context) => ReplayScreen(),
  TrackerScreen.route: (context) => TrackerScreen(),
};
