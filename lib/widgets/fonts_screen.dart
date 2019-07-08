/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:conreality_fonts/conreality_fonts.dart' show ConrealityFonts, B612, B612Mono;

////////////////////////////////////////////////////////////////////////////////

const String sampleText = "The quick brown fox jumps over the lazy dog";

////////////////////////////////////////////////////////////////////////////////

class FontsScreen extends StatelessWidget {
  static const route = "/widgets/fonts";

  FontsScreen({Key key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fonts"),
        actions: <Widget>[
          IconButton(
            icon: Text(ConrealityFonts.version),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            FontSample(sampleText, style: B612.normal),
            FontSample(sampleText, style: B612.italic),
            FontSample(sampleText, style: B612.bold),
            FontSample(sampleText, style: B612.boldItalic),
            FontSample(sampleText, style: B612Mono.normal.copyWith(fontSize: 12)),
            FontSample(sampleText, style: B612Mono.italic.copyWith(fontSize: 12)),
            FontSample(sampleText, style: B612Mono.bold.copyWith(fontSize: 12)),
            FontSample(sampleText, style: B612Mono.boldItalic.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class FontSample extends StatelessWidget {
  FontSample(this.text, {Key key, this.style}) : super(key: key);

  final String text;
  final TextStyle style;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }
}
