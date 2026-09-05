import Foundation

extension Optional where Wrapped == String {
    /// Returns the wrapped string or an empty string when nil.
    var orEmpty: String {
        self ?? ""
    }

    /// Returns true when the optional string is nil or empty.
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
}

extension Optional {
    /// Returns true when the optional contains a value.
    var isNotNil: Bool {
        self != nil
    }
}
