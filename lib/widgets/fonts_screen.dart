/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_fonts/conreality_fonts.dart';

////////////////////////////////////////////////////////////////////////////////

class FontsScreen extends StatefulWidget {
  static const route = "/widgets/fonts";

  FontsScreen({Key key}) : super(key: key);

  @override
  State<FontsScreen> createState() => _FontsState();
}

////////////////////////////////////////////////////////////////////////////////

class _FontsState extends State<FontsScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fonts"),
        actions: <Widget>[
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Container()), // TODO
    );
  }
}
