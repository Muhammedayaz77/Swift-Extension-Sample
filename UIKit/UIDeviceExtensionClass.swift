import UIKit

extension UIDevice {
    /// Returns the device name.
    func getDeviceName()->String{name}
    /// Returns the device model.
    func getDeviceModel()->String{model}
    /// Returns the system name.
    func getSystemName()->String{systemName}
    /// Returns the system version.
    func getSystemVersion()->String{systemVersion}
    /// Returns the device identifier string.
    func getDeviceIdentifier()->String{identifierForVendor?.uuidString ?? ""}
    /// Returns the current device orientation.
    func getDeviceOrientation()->UIDeviceOrientation{orientation}
    /// Returns true for iPhone devices.
    func isIPhone()->Bool{userInterfaceIdiom == .phone}
    /// Returns true for iPad devices.
    func isIPad()->Bool{userInterfaceIdiom == .pad}
    /// Returns true for simulator environments when detectable.
    func isSimulator()->Bool{ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil}
    /// Returns whether the device is charging.
    func isCharging()->Bool{batteryState == .charging || batteryState == .full}
    /// Returns battery level.
    func getBatteryLevel()->Float{batteryLevel}
    /// Returns battery state.
    func getBatteryState()->UIDevice.BatteryState{batteryState}
    /// Enables battery monitoring.
    func enableBatteryMonitoring(){isBatteryMonitoringEnabled=true}
    /// Disables battery monitoring.
    func disableBatteryMonitoring(){isBatteryMonitoringEnabled=false}
    /// Returns whether battery monitoring is enabled.
    func isBatteryMonitoringEnabledNow()->Bool{isBatteryMonitoringEnabled}
    /// Returns true when orientation is portrait.
    func isPortraitOrientation()->Bool{orientation == .portrait || orientation == .portraitUpsideDown}
    /// Returns true when orientation is landscape.
    func isLandscapeOrientation()->Bool{orientation == .landscapeLeft || orientation == .landscapeRight}
    /// Returns true when orientation is face up.
    func isFaceUp()->Bool{orientation == .faceUp}
    /// Returns true when orientation is face down.
    func isFaceDown()->Bool{orientation == .faceDown}
    /// Returns the current user interface idiom.
    func getInterfaceIdiom()->UIUserInterfaceIdiom{userInterfaceIdiom}
    /// Returns whether the device supports haptics.
    func supportsHaptics()->Bool{UIDevice.current.userInterfaceIdiom == .phone}
}
