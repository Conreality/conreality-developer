/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'routes.dart';
import 'script_screen.dart' show ScriptScreen;
import 'package:flutter/services.dart' show MethodChannel;

////////////////////////////////////////////////////////////////////////////////

const MethodChannel _channel = const MethodChannel('app.conreality/developer');

void main() async {
  final version = await _channel.invokeMethod('getVersion');
  print("Version ${version}");
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
          : ScriptScreen(),
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
