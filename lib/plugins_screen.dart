/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

import 'main_drawer.dart' show MainDrawer;
import 'plugins.dart' show plugins;

////////////////////////////////////////////////////////////////////////////////

class PluginsScreen extends StatefulWidget {
  static const route = "/plugins";

  PluginsScreen({Key key}) : super(key: key);

  @override
  State<PluginsScreen> createState() => _PluginsState();
}

////////////////////////////////////////////////////////////////////////////////

class _PluginsState extends State<PluginsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plugins"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      drawer: MainDrawer(),
      body: Center(child: PluginList()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class PluginList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: plugins.length,
      itemBuilder: (final BuildContext context, final int index) {
        final plugin = plugins[index];
        return GestureDetector(
          child: ListTile(
            leading: Icon(plugin.icon ?? MdiIcons.videoInputComponent),
            title: Text(plugin.label),
            subtitle: Text(plugin.summary),
            trailing: Icon(Icons.check_box, color: Theme.of(context).disabledColor),
          ),
          onTap: () {
            // TODO
          },
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}
