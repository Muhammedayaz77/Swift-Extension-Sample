//
//  StringExtensionClass.swift
//  Swift-Extension-Sample
//
//  Hind Tech Group (HTG)
//

import Foundation

extension String {
    /// Returns the number of characters in the string.
    func getLength() -> Int { count }

    /// Replaces all occurrences of a target string with another string.
    func replace(target: String, withString: String) -> String { replacingOccurrences(of: target, with: withString) }

    /// Removes leading zero characters from the string.
    func removeLeadingZeros() -> String { replacingOccurrences(of: "^0+", with: "", options: .regularExpression) }

    /// Returns a substring between two character offsets.
    func subStringInRange(from: Int, to: Int) -> String {
        guard from >= 0, to >= from, from < count else { return "" }
        let start = index(startIndex, offsetBy: from)
        let endOffset = min(to, count - 1)
        let end = index(startIndex, offsetBy: endOffset)
        return String(self[start...end])
    }

    /// Returns the text before the first occurrence of a character.
    func getSubStringWithCharacter(_ char: Character) -> String {
        firstIndex(of: char).map { String(self[..<$0]) } ?? self
    }

    /// Returns the first component separated by the supplied string.
    func getSubStringSeparatedByFirst(_ char: String) -> String { components(separatedBy: char).first ?? "" }

    /// Splits the string into components using the supplied separator.
    func componentsSeparatedByChar(_ char: String) -> [String] { components(separatedBy: char) }

    /// Trims whitespace and newline characters from both ends.
    func trimWhiteSpaces() -> String { trimmingCharacters(in: .whitespacesAndNewlines) }

    /// Returns true when the string is empty or contains only whitespace.
    func isBlank() -> Bool { trimWhiteSpaces().isEmpty }

    /// Returns true when the string contains only numeric characters.
    func containsOnlyNumbers() -> Bool { !isEmpty && allSatisfy(\.isNumber) }

    /// Returns true when the string is a valid email address.
    func isValidEmail() -> Bool { range(of: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: [.regularExpression, .caseInsensitive]) != nil }

    /// Returns true when the string contains a valid HTTP or HTTPS URL.
    func isValidURL() -> Bool { URL(string: self)?.scheme?.lowercased().hasPrefix("http") == true }

    /// Converts the string to an integer when possible.
    func getInt() -> Int? { Int(trimWhiteSpaces()) }

    /// Converts the string to a Double when possible.
    func getDouble() -> Double? { Double(trimWhiteSpaces()) }

    /// Capitalizes the first character of the string.
    func capitalizeFirstCharacter() -> String { prefix(1).uppercased() + dropFirst() }

    /// Converts the string to lowercase safely.
    func toLowerCase() -> String { lowercased() }

    /// Converts the string to uppercase safely.
    func toUpperCase() -> String { uppercased() }

    /// Returns the string with all whitespace removed.
    func removeAllSpaces() -> String { replacingOccurrences(of: " ", with: "") }

    /// Returns true when the string starts with the supplied prefix.
    func startsWithText(_ text: String) -> Bool { hasPrefix(text) }

    /// Returns true when the string ends with the supplied suffix.
    func endsWithText(_ text: String) -> Bool { hasSuffix(text) }

    /// Returns a string containing only the requested maximum number of characters.
    func getLimitedLength(_ maxLength: Int) -> String { String(prefix(max(0, maxLength))) }
}
