/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'camera_screen.dart' show CameraScreen;
import 'chat_screen.dart' show ChatScreen;
import 'compass_screen.dart' show CompassScreen;
import 'dosimeter_screen.dart' show DosimeterScreen;
import 'login_screen.dart' show LoginScreen;
import 'map_screen.dart' show MapScreen;
import 'replay_screen.dart' show ReplayScreen;
import 'tracker_screen.dart' show TrackerScreen;

////////////////////////////////////////////////////////////////////////////////

class WidgetInfo {
  final IconData icon;
  final String route;
  final String label;
  final String summary;

  const WidgetInfo(this.icon, this.route, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<WidgetInfo> _widgets = [
  WidgetInfo(Icons.camera, CameraScreen.route, "Camera", "An augmented-reality camera widget for Conreality games."),
  WidgetInfo(Icons.chat, ChatScreen.route, "Chat", "A chat widget for Conreality games."),
  WidgetInfo(Icons.navigation, CompassScreen.route, "Compass", "A compass widget for Conreality games."),
  WidgetInfo(null, DosimeterScreen.route, "Dosimeter", "A personal radiation dosimeter (Geiger counter) widget for Conreality games."), // TODO: icon
  WidgetInfo(null, LoginScreen.route, "Login", "A login widget for Conreality games."), // TODO: icon
  WidgetInfo(Icons.map, MapScreen.route, "Map", "A game map widget for Conreality games."),
  WidgetInfo(Icons.history, ReplayScreen.route, "Replay", "A game history replay widget for Conreality games."),
  WidgetInfo(Icons.track_changes, TrackerScreen.route, "Tracker", "A directional tracker widget for Conreality games."),
];

////////////////////////////////////////////////////////////////////////////////

class WidgetList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: _widgets.length,
      itemBuilder: (final BuildContext context, final int index) {
        final WidgetInfo widget = _widgets[index];
        return GestureDetector(
          child: ListTile(
            leading: Icon(widget.icon ?? Icons.widgets),
            title: Text(widget.label),
            subtitle: Text(widget.summary),
            //trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(widget.route);
          },
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}
