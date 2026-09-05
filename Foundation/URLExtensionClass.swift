import Foundation

extension URL {

    /// Returns the URL scheme.
    func getScheme() -> String? {
        scheme
    }

    /// Returns the host.
    func getHost() -> String? {
        host
    }

    /// Returns the path.
    func getPath() -> String {
        path
    }

    /// Returns the last path component.
    func getLastPathComponent() -> String {
        lastPathComponent
    }

    /// Returns the file extension.
    func getFileExtension() -> String {
        pathExtension
    }

    /// Returns the file name without extension.
    func getFileName() -> String {
        deletingPathExtension().lastPathComponent
    }

    /// Returns true for HTTP URLs.
    func isHTTP() -> Bool {
        scheme?.lowercased() == "http"
    }

    /// Returns true for HTTPS URLs.
    func isHTTPS() -> Bool {
        scheme?.lowercased() == "https"
    }

    /// Returns true when a URL has a scheme.
    func hasScheme() -> Bool {
        scheme != nil
    }

    /// Returns true when a URL has a host.
    func hasHost() -> Bool {
        host != nil
    }

    /// Returns an absolute URL string.
    func getAbsoluteString() -> String {
        absoluteString
    }

    /// Returns percent-encoded URL string.
    func getEncodedString() -> String {
        absoluteString.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) ?? absoluteString
    }

    /// Returns query string.
    func getQuery() -> String? {
        query
    }

    /// Returns fragment.
    func getFragment() -> String? {
        fragment
    }

    /// Returns path components.
    func getPathComponents() -> [String] {
        pathComponents
    }

    /// Appends a path component.
    func appendingPath(_ component: String) -> URL {
        appendingPathComponent(component)
    }

    /// Returns a URL without its query.
    func removingQuery() -> URL {
        var components = URLComponents(
            url: self,
            resolvingAgainstBaseURL: false
        )
        components?.query = nil
        return components?.url ?? self
    }

    /// Returns a URL without its fragment.
    func removingFragment() -> URL {
        var components = URLComponents(
            url: self,
            resolvingAgainstBaseURL: false
        )
        components?.fragment = nil
        return components?.url ?? self
    }

    /// Returns true when the URL points to a file.
    func isFileURLValue() -> Bool {
        isFileURL
    }

    /// Returns the URL resource file size when available.
    func getFileSize() -> Int64? {
        try? resourceValues(forKeys: [.fileSizeKey]).fileSize.map(Int64.init)
    }

    /// Returns the URL as a local file path.
    func getLocalPath() -> String {
        path
    }
}
