/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

import 'plugins_screen.dart' show PluginsScreen;
import 'routes.dart' show appRoutes;
import 'src/gdk.dart' show GDK, GDKThread;

////////////////////////////////////////////////////////////////////////////////

void main() async {
  bg.BackgroundGeolocation.onProviderChange((final bg.ProviderChangeEvent event) {
    print('BackgroundGeolocation.onProviderChange: $event'); // TODO
  });
  bg.BackgroundGeolocation.onMotionChange((final bg.Location location) {
    print('BackgroundGeolocation.onMotionChange: $location'); // TODO
  });
  bg.BackgroundGeolocation.onActivityChange((final bg.ActivityChangeEvent event) {
    print('BackgroundGeolocation.onActivityChange: $event'); // TODO
  });
  bg.BackgroundGeolocation.onLocation((final bg.Location location) {
    print('BackgroundGeolocation.onLocation: $location'); // TODO
  });
  bg.BackgroundGeolocation.onHeartbeat((final bg.HeartbeatEvent event) {
    print('BackgroundGeolocation.onHeartbeat: $event'); // TODO
  });
  bg.BackgroundGeolocation.ready(bg.Config(
    reset: true,
    startOnBoot: false,
    stopOnTerminate: true, // don't continue tracking after app terminates
    //enableHeadless: true, // FIXME
    foregroundService: true,
    notification: bg.Notification(
      channelName: "Location",
      title: "Conreality Developer",
      text: "Tracking your location.",
      priority: bg.Config.NOTIFICATION_PRIORITY_HIGH,
    ),
    heartbeatInterval: 60, // the minimum interval on Android is 60s
    desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
    distanceFilter: 3.0, // meters
    //debug: true,
    logLevel: bg.Config.LOG_LEVEL_VERBOSE,
  )).then((final bg.State state) {
    print('BackgroundGeolocation.ready: $state');
    if (!state.enabled) {
      bg.BackgroundGeolocation.start();
    }
  });

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
          : PluginsScreen(), // TODO
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
