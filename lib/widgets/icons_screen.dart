/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

////////////////////////////////////////////////////////////////////////////////

class IconsScreen extends StatelessWidget {
  static const route = "/widgets/icons";

  IconsScreen({Key key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icons"),
        actions: <Widget>[
          IconButton(
            icon: Text(ConrealityIcons.version),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: IconList()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class IconList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final iconMap = ConrealityIcons.toMap();
    final iconKeys = iconMap.keys.toList();
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: iconKeys.length,
      itemBuilder: (final BuildContext context, final int index) {
        final iconKey = iconKeys[index];
        final icon = iconMap[iconKey];
        return GestureDetector(
          child: ListTile(
            leading: Icon(icon),
            title: Text(iconKey),
          ),
          onTap: () {
            // TODO: zoom in on icon?
          },
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}
