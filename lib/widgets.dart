/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show Icons, IconData;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

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
  WidgetInfo(MdiIcons.cameraEnhance, CameraScreen.route, "Camera", "Augmented-reality camera widget."),
  WidgetInfo(MdiIcons.chat, ChatScreen.route, "Chat", "Team chat widgets."),
  WidgetInfo(MdiIcons.compassOutline, CompassScreen.route, "Compass", "Compass widget."),
  WidgetInfo(MdiIcons.timer, CountdownScreen.route, "Countdown", "Countdown timer widget."),
  WidgetInfo(MdiIcons.radioactive, DosimeterScreen.route, "Dosimeter", "Personal radiation dosimeter widget."),
  WidgetInfo(MdiIcons.formatFont, FontsScreen.route, "Fonts", "Conreality font assets."),
  WidgetInfo(MdiIcons.gamepadVariant, GamepadScreen.route, "Gamepad", "Gamepad widget for robot control."),
  WidgetInfo(MdiIcons.emoticonCoolOutline, IconsScreen.route, "Icons", "Conreality icon assets."),
  WidgetInfo(MdiIcons.cameraControl, JoystickScreen.route, "Joystick", "Joystick widget for robot control."),
  WidgetInfo(MdiIcons.login, LoginScreen.route, "Login", "Login form widgets."),
  WidgetInfo(MdiIcons.watermark, LogoScreen.route, "Logo", "Conreality logo assets."), // TODO: better icon?
  WidgetInfo(MdiIcons.map, MapScreen.route, "Map", "Game map and marker widgets."),
  WidgetInfo(MdiIcons.mapClock, ReplayScreen.route, "Replay", "Game history replay widgets."),
  WidgetInfo(MdiIcons.radar, TrackerScreen.route, "Tracker", "Directional and distance tracker widgets."),
];
