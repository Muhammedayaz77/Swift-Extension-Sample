import Foundation

extension Encodable {
    /// Encodes the value into JSON data.
    func toJSONData() throws -> Data {
        try JSONEncoder().encode(self)
    }
}

extension Data {
    /// Decodes the data into the requested Decodable type.
    func decoded<T: Decodable>(as type: T.Type) throws -> T {
        try JSONDecoder().decode(type, from: self)
    }

    /// Returns a pretty-printed JSON string when the data contains valid JSON.
    func prettyJSONString() -> String? {
        guard let object = try? JSONSerialization.jsonObject(with: self),
              JSONSerialization.isValidJSONObject(object),
              let prettyData = try? JSONSerialization.data(
                  withJSONObject: object,
                  options: [.prettyPrinted, .sortedKeys]
              ) else {
            return String(data: self, encoding: .utf8)
        }

        return String(data: prettyData, encoding: .utf8)
    }
}
