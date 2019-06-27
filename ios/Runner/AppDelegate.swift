/* This is free and unencumbered software released into the public domain. */

import UIKit
import Flutter
import Developer

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "app.conreality/developer", binaryMessenger: controller)
    channel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      if call.method == "getVersion" {
        self?.receiveVersion(result: result)
        return
      }
      result(FlutterMethodNotImplemented)
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func receiveVersion(result: FlutterResult) {
    result(DeveloperVersion())
  }
}
