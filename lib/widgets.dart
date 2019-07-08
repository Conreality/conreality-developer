/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show IconData;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

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

class WidgetInfo {
  final IconData icon;
  final String route;
  final String label;
  final String summary;

  const WidgetInfo(this.icon, this.route, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<WidgetInfo> widgets = const <WidgetInfo>[
  WidgetInfo(ConrealityIcons.camera, CameraScreen.route, "Camera", "Augmented-reality camera widget."),
  WidgetInfo(ConrealityIcons.chat, ChatScreen.route, "Chat", "Team chat widgets."),
  WidgetInfo(ConrealityIcons.compass, CompassScreen.route, "Compass", "Compass widget."),
  WidgetInfo(ConrealityIcons.countdown, CountdownScreen.route, "Countdown", "Countdown timer widget."),
  WidgetInfo(ConrealityIcons.detector, DetectorScreen.route, "Detector", "Anomaly and artifact detector widgets."),
  WidgetInfo(ConrealityIcons.dosimeter, DosimeterScreen.route, "Dosimeter", "Personal radiation dosimeter widget."),
  WidgetInfo(ConrealityIcons.font, FontsScreen.route, "Fonts", "Conreality font assets."),
  WidgetInfo(ConrealityIcons.gamepad, GamepadScreen.route, "Gamepad", "Gamepad widget for robot control."),
  WidgetInfo(ConrealityIcons.icon, IconsScreen.route, "Icons", "Conreality icon assets."),
  WidgetInfo(ConrealityIcons.joystick, JoystickScreen.route, "Joystick", "Joystick widget for robot control."),
  WidgetInfo(ConrealityIcons.login, LoginScreen.route, "Login", "Login form widgets."),
  WidgetInfo(ConrealityIcons.logo, LogoScreen.route, "Logo", "Conreality logo assets."),
  WidgetInfo(ConrealityIcons.map, MapScreen.route, "Map", "Game map and marker widgets."),
  WidgetInfo(ConrealityIcons.replay, ReplayScreen.route, "Replay", "Game history replay widgets."),
  WidgetInfo(ConrealityIcons.scene, SceneScreen.route, "Scene", "3D polygon mesh rendering widget."),
  WidgetInfo(ConrealityIcons.tracker, TrackerScreen.route, "Tracker", "Directional and distance tracker widgets."),
];
