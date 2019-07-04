/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;

import 'widgets/camera_screen.dart' show CameraScreen;
import 'widgets/chat_screen.dart' show ChatScreen;
import 'widgets/compass_screen.dart' show CompassScreen;
import 'widgets/countdown_screen.dart' show CountdownScreen;
import 'widgets/dosimeter_screen.dart' show DosimeterScreen;
import 'widgets/fonts_screen.dart' show FontsScreen;
import 'widgets/gamepad_screen.dart' show GamepadScreen;
import 'widgets/icons_screen.dart' show IconsScreen;
import 'widgets/joystick_screen.dart' show JoystickScreen;
import 'widgets/login_screen.dart' show LoginScreen;
import 'widgets/logo_screen.dart' show LogoScreen;
import 'widgets/map_screen.dart' show MapScreen;
import 'widgets/replay_screen.dart' show ReplayScreen;
import 'widgets/tracker_screen.dart' show TrackerScreen;

////////////////////////////////////////////////////////////////////////////////

class WidgetInfo {
  final IconData icon;
  final String route;
  final String label;
  final String summary;

  const WidgetInfo(this.icon, this.route, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<WidgetInfo> widgets = const <WidgetInfo>[
  WidgetInfo(Icons.camera, CameraScreen.route, "Camera", "Augmented-reality camera widget."),
  WidgetInfo(Icons.chat, ChatScreen.route, "Chat", "Team chat widgets."),
  WidgetInfo(Icons.navigation, CompassScreen.route, "Compass", "Compass widget."),
  WidgetInfo(null, CountdownScreen.route, "Countdown", "Countdown timer widget."), // TODO: icon
  WidgetInfo(null, DosimeterScreen.route, "Dosimeter", "Personal radiation dosimeter widget."), // TODO: icon
  WidgetInfo(null, FontsScreen.route, "Fonts", "Conreality font assets."), // TODO: icon
  WidgetInfo(null, GamepadScreen.route, "Gamepad", "Gamepad widget for robot control."), // TODO: icon
  WidgetInfo(null, IconsScreen.route, "Icons", "Conreality icon assets."), // TODO: icon
  WidgetInfo(null, JoystickScreen.route, "Joystick", "Joystick widget for robot control."), // TODO: icon
  WidgetInfo(null, LoginScreen.route, "Login", "Login form widgets."), // TODO: icon
  WidgetInfo(null, LogoScreen.route, "Logo", "Conreality logo assets."), // TODO: icon
  WidgetInfo(Icons.map, MapScreen.route, "Map", "Game map and marker widgets."),
  WidgetInfo(Icons.history, ReplayScreen.route, "Replay", "Game history replay widgets."),
  WidgetInfo(Icons.track_changes, TrackerScreen.route, "Tracker", "Directional and distance tracker widgets."),
];
