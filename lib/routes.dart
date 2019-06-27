/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart' show WidgetBuilder;

import 'script_screen.dart' show ScriptScreen;

////////////////////////////////////////////////////////////////////////////////

Map<String, WidgetBuilder> appRoutes = {
  ScriptScreen.route: (context) => ScriptScreen(),
};
