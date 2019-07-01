/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'routes.dart' show appRoutes;
import 'widgets_screen.dart' show WidgetsScreen;
import 'src/gdk.dart' show GDK, GDKThread;

////////////////////////////////////////////////////////////////////////////////

void main() async {
  print("Conreality GDK ${await GDK.version}");
  final thread = await GDKThread.spawn();
  print(await thread.evalAsset("scripts/hello.luac")); // DEBUG
  runApp(App());
}

////////////////////////////////////////////////////////////////////////////////

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Object _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final Map<String, WidgetBuilder> routes = {};
    routes.addAll(appRoutes);
    return MaterialApp(
      color: Colors.grey,
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: (_error != null)
          ? Text(_error.toString())
          : WidgetsScreen(), // TODO
      routes: routes,
    );
  }

  void _load() async {
    try {
      //await config.init();
      //await database.init();
    } catch (error) {
      setState(() {
        _error = error;
      });
    }
  }
}
