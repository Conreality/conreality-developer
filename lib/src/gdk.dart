/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel, PlatformException;

import 'dart:io' show File, IOException;

////////////////////////////////////////////////////////////////////////////////

const MethodChannel _global = const MethodChannel('app.conreality/developer');

////////////////////////////////////////////////////////////////////////////////

abstract class GDK {
  /// The current GDK runtime version.
  static Future<String> get version async {
    return await _global.invokeMethod('getVersion');
  }
}

////////////////////////////////////////////////////////////////////////////////

class GDKError implements IOException {
  final String message;

  const GDKError(this.message);

  GDKError.from(final PlatformException exception)
      : message = exception.message;

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write("GDKError");
    if (message.isNotEmpty) {
      buffer..write(": ")..write(message);
    }
    return buffer.toString();
  }
}

////////////////////////////////////////////////////////////////////////////////

class GDKThread {
  final int id;
  final MethodChannel _thread;

  GDKThread._(this.id) : _thread = MethodChannel('app.conreality/developer/#$id');

  /// Spawns a new GDK interpreter thread.
  static Future<GDKThread> spawn() async {
    try {
      final int id = await _global.invokeMethod('spawnThread');
      final thread = GDKThread._(id);
      await thread.evalAsset("scripts/prelude.luac");
      return thread;
    } on PlatformException catch (error) {
      throw GDKError.from(error);
    }
  }

  /// Evaluates a GDK code snippet, returning a result.
  Future<dynamic> eval(final String code) async {
    try {
      return await _thread.invokeMethod('evalString', code);
    } on PlatformException catch (error) {
      throw GDKError.from(error);
    }
  }

  /// Evaluates a bundled GDK script file, returning a result.
  Future<dynamic> evalAsset(final String assetName) async {
    try {
      return await _thread.invokeMethod('evalAsset', assetName);
    } on PlatformException catch (error) {
      throw GDKError.from(error);
    }
  }

  /// Evaluates a GDK script file, returning a result.
  Future<dynamic> evalFile(final File path) async {
    try {
      final absolutePath = path.isAbsolute ? path : path.absolute;
      return await _thread.invokeMethod('evalFile', absolutePath.toString());
    } on PlatformException catch (error) {
      throw GDKError.from(error);
    }
  }

  /// Executes a GDK code snippet, for its side effects.
  Future<void> exec(final String code) async {
    try {
      await _thread.invokeMethod('evalString', code);
    } on PlatformException catch (error) {
      throw GDKError.from(error);
    }
  }

  /// Executes a bundled GDK script file, for its side effects.
  Future<void> execAsset(final String assetName) async {
    try {
      await _thread.invokeMethod('evalAsset', assetName);
    } on PlatformException catch (error) {
      throw GDKError.from(error);
    }
  }

  /// Executes a GDK script file, for its side effects.
  Future<void> execFile(final File path) async {
    try {
      final absolutePath = path.isAbsolute ? path : path.absolute;
      await _thread.invokeMethod('evalFile', absolutePath.toString());
    } on PlatformException catch (error) {
      throw GDKError.from(error);
    }
  }
}
