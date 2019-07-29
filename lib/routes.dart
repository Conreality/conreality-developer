/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show WidgetBuilder;

import 'features_screen.dart' show FeaturesScreen;
import 'filters_screen.dart' show FiltersScreen;
import 'plugins_screen.dart' show PluginsScreen;
import 'sensors_screen.dart' show SensorsScreen;
import 'scripts_screen.dart' show ScriptsScreen;
import 'widgets_screen.dart' show WidgetsScreen;

import 'features/chat_feature.dart' show ChatFeature;

import 'plugins/beacon_screen.dart' show BeaconScreen;
import 'plugins/headset_screen.dart' show HeadsetScreen;
import 'plugins/pulse_screen.dart' show PulseScreen;

import 'widgets/camera_screen.dart' show CameraScreen;
import 'widgets/chat_screen.dart' show ChatScreen;
import 'widgets/compass_screen.dart' show CompassScreen;
import 'widgets/countdown_screen.dart' show CountdownScreen;
import 'widgets/detector_screen.dart' show DetectorScreen;
import 'widgets/dosimeter_screen.dart' show DosimeterScreen;
import 'widgets/fonts_screen.dart' show FontsScreen;
import 'widgets/gamepad_screen.dart' show GamepadScreen;
import 'widgets/icons_screen.dart' show IconsScreen;
import 'widgets/joystick_screen.dart' show JoystickScreen;
import 'widgets/login_screen.dart' show LoginScreen;
import 'widgets/logo_screen.dart' show LogoScreen;
import 'widgets/map_screen.dart' show MapScreen;
import 'widgets/replay_screen.dart' show ReplayScreen;
import 'widgets/scene_screen.dart' show SceneScreen;
import 'widgets/tracker_screen.dart' show TrackerScreen;

////////////////////////////////////////////////////////////////////////////////

Map<String, WidgetBuilder> appRoutes = {
  // Drawer
  FeaturesScreen.route: (_) => FeaturesScreen(),
  FiltersScreen.route: (_) => FiltersScreen(),
  PluginsScreen.route: (_) => PluginsScreen(),
  SensorsScreen.route: (_) => SensorsScreen(),
  ScriptsScreen.route: (_) => ScriptsScreen(),
  WidgetsScreen.route: (_) => WidgetsScreen(),
  // Features
  ChatFeature.route: (_) => ChatFeature(),
  // Plugins
  BeaconScreen.route: (_) => BeaconScreen(),
  HeadsetScreen.route: (_) => HeadsetScreen(),
  PulseScreen.route: (_) => PulseScreen(),
  // Widgets
  CameraScreen.route: (_) => CameraScreen(),
  ChatScreen.route: (_) => ChatScreen(),
  CompassScreen.route: (_) => CompassScreen(),
  CountdownScreen.route: (_) => CountdownScreen(),
  DetectorScreen.route: (_) => DetectorScreen(),
  DosimeterScreen.route: (_) => DosimeterScreen(),
  FontsScreen.route: (_) => FontsScreen(),
  GamepadScreen.route: (_) => GamepadScreen(),
  IconsScreen.route: (_) => IconsScreen(),
  JoystickScreen.route: (_) => JoystickScreen(),
  LoginScreen.route: (_) => LoginScreen(),
  LogoScreen.route: (_) => LogoScreen(),
  MapScreen.route: (_) => MapScreen(),
  ReplayScreen.route: (_) => ReplayScreen(),
  SceneScreen.route: (_) => SceneScreen(),
  TrackerScreen.route: (_) => TrackerScreen(),
};
