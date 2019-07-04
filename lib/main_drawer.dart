/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;
import 'package:package_info/package_info.dart' show PackageInfo;

////////////////////////////////////////////////////////////////////////////////

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String _applicationName = "Unknown";
  String _applicationVersion = "Unknown";

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(final BuildContext context) {
    final List<Widget> items = <Widget>[
      ListTile(
        leading: Icon(MdiIcons.widgets),
        title: Text("Widgets"),
        onTap: () => Navigator.of(context).pushNamed("/widgets"),
      ),
      ListTile(
        leading: Icon(MdiIcons.videoInputComponent),
        title: Text("Plugins"),
        onTap: () => Navigator.of(context).pushNamed("/plugins"),
      ),
      ListTile(
        leading: Icon(MdiIcons.script),
        title: Text("Scripts"),
        onTap: () => Navigator.of(context).pushNamed("/scripts"),
      ),
      ListTile(
        leading: Icon(MdiIcons.leak),
        title: Text("Sensors"),
        onTap: () => Navigator.of(context).pushNamed("/sensors"),
      ),
      ListTile(
        leading: Icon(MdiIcons.imageFilter),
        title: Text("Filters"),
        onTap: () => Navigator.of(context).pushNamed("/filters"),
      ),
      Divider(),
      AboutListTile(
        icon: FlutterLogo(), // TODO
        applicationName: _applicationName,
        applicationVersion: _applicationVersion,
        applicationIcon: FlutterLogo(), // TODO
        applicationLegalese: "This is free and unencumbered software released into the public domain.",
        aboutBoxChildren: <Widget>[],
      ),
    ];

    return Drawer(
      child: ListView(
        primary: false,
        children: items,
      ),
    );
  }

  void _load() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _applicationName = packageInfo.appName;
        _applicationVersion = packageInfo.version;
      });
    } catch (error) {}
  }
}
