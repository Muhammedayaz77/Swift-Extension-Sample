import Foundation

extension Bundle {

    /// Returns the app display name.
    func getAppName() -> String {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
            ?? object(forInfoDictionaryKey: "CFBundleName") as? String
            ?? ""
    }

    /// Returns the bundle identifier.
    func getBundleIdentifier() -> String {
        return bundleIdentifier ?? ""
    }

    /// Returns the app version.
    func getAppVersion() -> String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }

    /// Returns the build number.
    func getBuildNumber() -> String {
        return object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    }

    /// Returns the bundle name.
    func getBundleName() -> String {
        return object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
    }

    /// Returns the bundle URL.
    func getBundleURL() -> URL? {
        return bundleURL
    }

    /// Returns the resource URL for a name.
    func getResourceURL(_ name: String, extension ext: String? = nil) -> URL? {
        return url(forResource: name, withExtension: ext)
    }

    /// Returns a path for a resource.
    func getResourcePath(_ name: String, extension ext: String? = nil) -> String? {
        return path(forResource: name, ofType: ext)
    }

    /// Returns a localized string from the bundle.
    func getLocalizedString(_ key: String) -> String {
        return localizedString(forKey: key, value: nil, table: nil)
    }

    /// Returns whether a resource exists.
    func hasResource(_ name: String, extension ext: String? = nil) -> Bool {
        return getResourceURL(name, extension: ext) != nil
    }

    /// Returns all bundle resource paths.
    func getResourcePaths() -> [String] {
        return paths ?? []
    }

    /// Returns the executable URL.
    func getExecutableURL() -> URL? {
        return executableURL
    }

    /// Returns the executable path.
    func getExecutablePath() -> String? {
        return executablePath
    }

    /// Returns the bundle version as a semantic string.
    func getVersionString() -> String {
        return getAppVersion() + " (" + getBuildNumber() + ")"
    }

    /// Returns the development region.
    func getDevelopmentRegion() -> String {
        return object(forInfoDictionaryKey: "CFBundleDevelopmentRegion") as? String ?? ""
    }

    /// Returns the package type.
    func getPackageType() -> String {
        return object(forInfoDictionaryKey: "CFBundlePackageType") as? String ?? ""
    }

    /// Returns supported localizations.
    func getLocalizations() -> [String] {
        return localizations
    }

    /// Returns preferred localizations.
    func getPreferredLocalizations() -> [String] {
        return preferredLocalizations
    }

    /// Returns the bundle resource URL.
    func getResourcesDirectoryURL() -> URL? {
        return resourceURL
    }

    /// Returns whether this is the main application bundle.
    func isMainApplicationBundle() -> Bool {
        return self == Bundle.main
    }
}
