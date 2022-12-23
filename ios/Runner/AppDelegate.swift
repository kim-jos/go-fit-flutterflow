import UIKit
import Braintree

import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCTzrz2l2AF_i8yv_BUKFIvE-r55tXMVTU")
    GeneratedPluginRegistrant.register(with: self)
    BTAppContextSwitcher.setReturnURLScheme("com.korea.gofit.wellness.braintree")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
