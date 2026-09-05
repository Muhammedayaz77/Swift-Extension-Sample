import Foundation

extension Data {

    /// Returns the data as a UTF-8 string.
    func getUTF8String() -> String? {
        return String(data: self, encoding: .utf8)
    }

    /// Returns a Base64 encoded string.
    func getBase64String() -> String {
        return base64EncodedString()
    }

    /// Creates Data from a Base64 string.
    static func fromBase64String(_ value: String) -> Data? {
        return Data(base64Encoded: value)
    }

    /// Converts JSON data to a dictionary.
    func getJSONDictionary() -> [String: Any]? {
        return (try? JSONSerialization.jsonObject(with: self)) as? [String: Any]
    }

    /// Converts JSON data to an array.
    func getJSONArray() -> [Any]? {
        return (try? JSONSerialization.jsonObject(with: self)) as? [Any]
    }

    /// Converts a JSON-compatible value to Data.
    static func fromJSONObject(_ object: Any) -> Data? {
        return try? JSONSerialization.data(withJSONObject: object, options: [])
    }

    /// Returns a hexadecimal string.
    func getHexString() -> String {
        return map { String(format: "%02x", $0) }.joined()
    }

    /// Returns data length in bytes.
    func getByteCount() -> Int {
        return count
    }

    /// Returns whether data is empty.
    func isEmptyData() -> Bool {
        return isEmpty
    }

    /// Returns whether data starts with a byte sequence.
    func startsWith(_ prefix: [UInt8]) -> Bool {
        return self.starts(with: prefix)
    }

    /// Returns a copy with bytes reversed.
    func reversedData() -> Data {
        return Data(reversed())
    }

    /// Returns a subrange safely.
    func getSubData(from: Int, length: Int) -> Data {
        guard from >= 0, length >= 0, from < count else {
            return Data()
        }

        return subdata(in: from..<min(count, from + length))
    }

    /// Returns the first byte.
    func getFirstByte() -> UInt8? {
        return first
    }

    /// Returns the last byte.
    func getLastByte() -> UInt8? {
        return last
    }

    /// Returns true when data can be decoded as UTF-8.
    func isValidUTF8() -> Bool {
        return getUTF8String() != nil
    }

    /// Writes data to a URL.
    func saveToURL(_ url: URL) -> Bool {
        return (try? write(to: url)) != nil
    }

    /// Reads a UTF-8 string after trimming whitespace.
    func getTrimmedUTF8String() -> String? {
        return getUTF8String()?.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Returns JSON data as a pretty printed string.
    func getPrettyJSONString() -> String? {
        guard let object = try? JSONSerialization.jsonObject(with: self),
              let data = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

    /// Returns a Data copy.
    func copyData() -> Data {
        return Data(self)
    }

    /// Returns whether the data contains a byte.
    func containsByte(_ byte: UInt8) -> Bool {
        return contains(byte)
    }
}
