/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////

class PluginInfo {
  final IconData icon;
  final String label;
  final String summary;

  const PluginInfo(this.icon, this.label, this.summary);
}

////////////////////////////////////////////////////////////////////////////////

final List<PluginInfo> _plugins = [
  PluginInfo(null, "Headset", ""), // TODO: icon
];

////////////////////////////////////////////////////////////////////////////////

class PluginList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: _plugins.length,
      itemBuilder: (final BuildContext context, final int index) {
        final PluginInfo plugin = _plugins[index];
        return GestureDetector(
          child: ListTile(
            leading: Icon(plugin.icon ?? Icons.devices_other), // TODO: icon
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
