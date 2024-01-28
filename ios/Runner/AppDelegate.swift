import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKEY("AIzaSyC33a8roXjezZ_hhwBpu8aNgXomaN8LBms")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
