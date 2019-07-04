/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;
import 'package:conreality_scripts/conreality_scripts.dart' show Scripts;

import 'main_drawer.dart' show MainDrawer;
import 'scripts.dart' show scripts;

////////////////////////////////////////////////////////////////////////////////

class ScriptsScreen extends StatefulWidget {
  static const route = "/scripts";

  ScriptsScreen({Key key}) : super(key: key);

  @override
  State<ScriptsScreen> createState() => _ScriptsState();
}

////////////////////////////////////////////////////////////////////////////////

class _ScriptsState extends State<ScriptsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scripts"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      drawer: MainDrawer(),
      body: Center(child: ScriptList()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class ScriptList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: scripts.length,
      itemBuilder: (final BuildContext context, final int index) {
        final script = scripts[index];
        return GestureDetector(
          child: ListTile(
            leading: Icon(script.icon ?? MdiIcons.script),
            title: Text(script.label),
            subtitle: Text(script.summary),
            trailing: Icon(script.isRunning ? Icons.check_box : Icons.check_box_outline_blank, color: Theme.of(context).disabledColor),
          ),
          onTap: () async { // TODO
            final script = Scripts.all[script.label];
            print(script);
            print(await script.loadSource());
            print(await script.loadBinary());
          },
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}
