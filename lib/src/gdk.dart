/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel, PlatformException;

////////////////////////////////////////////////////////////////////////////////

const MethodChannel _channel = const MethodChannel('app.conreality/developer');

////////////////////////////////////////////////////////////////////////////////

abstract class GDK {
  /// The current GDK runtime version.
  static Future<String> get version async {
    return await _channel.invokeMethod('getVersion');
  }
}
