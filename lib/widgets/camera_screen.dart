/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_camera/conreality_camera.dart' show Camera;

////////////////////////////////////////////////////////////////////////////////

class CameraScreen extends StatefulWidget {
  static const route = "/widgets/camera";

  CameraScreen({Key key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraState();
}

////////////////////////////////////////////////////////////////////////////////

class _CameraState extends State<CameraScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(
        child: Camera(),
      ),
    );
  }
}
