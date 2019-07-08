/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

import 'main_drawer.dart' show MainDrawer;
import 'sensors.dart' show sensors;

////////////////////////////////////////////////////////////////////////////////

class SensorsScreen extends StatefulWidget {
  static const route = "/sensors";

  SensorsScreen({Key key}) : super(key: key);

  @override
  State<SensorsScreen> createState() => _SensorsState();
}

////////////////////////////////////////////////////////////////////////////////

class _SensorsState extends State<SensorsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensors"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      drawer: MainDrawer(),
      body: Center(child: SensorList()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class SensorList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: sensors.length,
      itemBuilder: (final BuildContext context, final int index) {
        final sensor = sensors[index];
        return GestureDetector(
          child: ListTile(
            leading: Icon(sensor.icon ?? ConrealityIcons.sensor),
            title: Text(sensor.label),
            subtitle: Text(sensor.summary),
            trailing: Icon(sensor.isPresent ? Icons.check_box : Icons.check_box_outline_blank, color: Theme.of(context).disabledColor),
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
