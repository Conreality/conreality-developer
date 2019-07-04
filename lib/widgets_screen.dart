/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'main_drawer.dart' show MainDrawer;
import 'widgets.dart' show widgets;

////////////////////////////////////////////////////////////////////////////////

class WidgetsScreen extends StatefulWidget {
  static const route = "/widgets";

  WidgetsScreen({Key key}) : super(key: key);

  @override
  State<WidgetsScreen> createState() => _WidgetsState();
}

////////////////////////////////////////////////////////////////////////////////

class _WidgetsState extends State<WidgetsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      drawer: MainDrawer(),
      body: Center(child: WidgetList()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class WidgetList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: widgets.length,
      itemBuilder: (final BuildContext context, final int index) {
        final widget = widgets[index];
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
