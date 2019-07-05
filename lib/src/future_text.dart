/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////

class FutureText extends StatelessWidget {
  FutureText(this.data, {Key key}) : super(key: key);

  final Future<String> data;

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (final BuildContext context, final AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:   // fall through
          case ConnectionState.active: // fall through
          case ConnectionState.waiting:
            return Container();
          case ConnectionState.done:
            return Text((snapshot.hasError ? snapshot.error.toString() : snapshot.data) ?? "");
        }
        return null; // unreachable
      },
    );
  }
}
