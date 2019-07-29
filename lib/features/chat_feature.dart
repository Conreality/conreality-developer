/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Stream, StreamSubscription;

import 'package:flutter/material.dart';

import 'package:conreality_headset/conreality_headset.dart'
    show ConrealityHeadset, Headset, HeadsetEvent, HeadsetStatus;
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;

////////////////////////////////////////////////////////////////////////////////

class ChatFeature extends StatefulWidget {
  static const route = "/features/chat";

  ChatFeature({Key key}) : super(key: key);

  @override
  State<ChatFeature> createState() => _ChatFeatureState();
}

////////////////////////////////////////////////////////////////////////////////

class _ChatFeatureState extends State<ChatFeature> {
  StreamSubscription<HeadsetEvent> _subscription;
  HeadsetStatus _status;

  @override
  void initState() {
    super.initState();
    _initStream();
  }

  void _initStream() async {
    await Headset.speak("Speak and be heard!");
    final Stream<HeadsetEvent> stream = await Headset.subscribe();
    if (stream != null) {
      _subscription = stream.listen((final HeadsetEvent event) {
        if (!mounted) return;
        switch (event.runtimeType) {
          case HeadsetStatus:
            setState(() {
              _status = (event as HeadsetStatus);
            });
            break;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: <Widget>[].where((element) => element != null).toList(),
      ),
      body: Center(
        child: Icon(
            _status?.isConnected == true
                ? ConrealityIcons.headset
                : ConrealityIcons.headsetOff,
            size: 320),
      ),
    );
  }
}
