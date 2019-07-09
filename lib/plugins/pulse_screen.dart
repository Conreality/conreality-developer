/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Stream, StreamSubscription;

import 'package:flutter/material.dart';

import 'package:conreality_fonts/conreality_fonts.dart' show B612;
import 'package:conreality_pulse/conreality_pulse.dart' show ConrealityPulse, Pulse, PulseEvent;

////////////////////////////////////////////////////////////////////////////////

class PulseScreen extends StatefulWidget {
  static const route = "/plugins/pulse";

  PulseScreen({Key key}) : super(key: key);

  @override
  State<PulseScreen> createState() => _PulseState();
}

////////////////////////////////////////////////////////////////////////////////

class _PulseState extends State<PulseScreen> {
  StreamSubscription<PulseEvent> _subscription;
  int _pulse = -1;

  @override
  void initState() {
    super.initState();
    _initStream();
  }

  void _initStream() async {
    final Stream<PulseEvent> stream = await Pulse.subscribe();
    if (stream != null) {
      _subscription = stream.listen((final PulseEvent event) {
        if (mounted) {
          setState(() {
            _pulse = event.value;
          });
        }
      });
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _subscription?.cancel();
    _subscription = null;
  }

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle style = theme.textTheme.title.copyWith(fontFamily: B612.fontFamily, fontSize: 56);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pulse"),
        actions: <Widget>[
          IconButton(
            icon: Text(ConrealityPulse.version),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      body: Center(child: Text((_pulse >= 0) ? _pulse.toString() : "N/A", style: style)),
    );
  }
}
