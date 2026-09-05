import Foundation

extension Bundle {
    /// Returns the app display name.
    func getAppName()->String{object(forInfoDictionaryKey:"CFBundleDisplayName") as? String ?? object(forInfoDictionaryKey:"CFBundleName") as? String ?? ""}
    /// Returns the bundle identifier.
    func getBundleIdentifier()->String{bundleIdentifier ?? ""}
    /// Returns the app version.
    func getAppVersion()->String{object(forInfoDictionaryKey:"CFBundleShortVersionString") as? String ?? ""}
    /// Returns the build number.
    func getBuildNumber()->String{object(forInfoDictionaryKey:"CFBundleVersion") as? String ?? ""}
    /// Returns the bundle name.
    func getBundleName()->String{object(forInfoDictionaryKey:"CFBundleName") as? String ?? ""}
    /// Returns the bundle URL.
    func getBundleURL()->URL?{bundleURL}
    /// Returns the resource URL for a name.
    func getResourceURL(_ name:String,extension ext:String?=nil)->URL?{url(forResource:name,withExtension:ext)}
    /// Returns a path for a resource.
    func getResourcePath(_ name:String,extension ext:String?=nil)->String?{path(forResource:name,ofType:ext)}
    /// Returns a localized string from the bundle.
    func getLocalizedString(_ key:String)->String{localizedString(forKey:key,value:nil,table:nil)}
    /// Returns whether a resource exists.
    func hasResource(_ name:String,extension ext:String?=nil)->Bool{getResourceURL(name,extension:ext) != nil}
    /// Returns all bundle resource paths.
    func getResourcePaths()->[String]{paths ?? []}
    /// Returns executable URL.
    func getExecutableURL()->URL?{executableURL}
    /// Returns executable path.
    func getExecutablePath()->String?{executablePath}
    /// Returns bundle version as a semantic string.
    func getVersionString()->String{getAppVersion()+" ("+getBuildNumber()+")"}
    /// Returns development region.
    func getDevelopmentRegion()->String{object(forInfoDictionaryKey:"CFBundleDevelopmentRegion") as? String ?? ""}
    /// Returns package type.
    func getPackageType()->String{object(forInfoDictionaryKey:"CFBundlePackageType") as? String ?? ""}
    /// Returns supported localizations.
    func getLocalizations()->[String]{localizations}
    /// Returns preferred localizations.
    func getPreferredLocalizations()->[String]{preferredLocalizations}
    /// Returns the bundle resource URL.
    func getResourcesDirectoryURL()->URL?{resourceURL}
    /// Returns whether this is the main application bundle.
    func isMainApplicationBundle()->Bool{self == Bundle.main}
}
