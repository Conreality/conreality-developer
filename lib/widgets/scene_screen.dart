/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_scene/conreality_scene.dart';

////////////////////////////////////////////////////////////////////////////////

class SceneScreen extends StatefulWidget {
  static const route = "/widgets/scene";

  SceneScreen({Key key}) : super(key: key);

  @override
  State<SceneScreen> createState() => _SceneState();
}

////////////////////////////////////////////////////////////////////////////////

class _SceneState extends State<SceneScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scene"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
