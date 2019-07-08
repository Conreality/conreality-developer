/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_logo/conreality_logo.dart' show ConrealityLogo;

////////////////////////////////////////////////////////////////////////////////

class LogoScreen extends StatelessWidget {
  static const route = "/widgets/logo";

  LogoScreen({Key key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logo"),
        actions: <Widget>[
          IconButton(
            icon: Text(ConrealityLogo.version),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      body: Center(
        child: ConrealityLogo(size: 320),
      ),
    );
  }
}
