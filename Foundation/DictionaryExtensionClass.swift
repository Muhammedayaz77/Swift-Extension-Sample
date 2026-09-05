import Foundation

extension Dictionary {
    /// Returns the number of key-value pairs.
    func getCount() -> Int {
        count
    }

    /// Returns true when the dictionary has no values.
    func isEmptyDictionary() -> Bool {
        isEmpty
    }

    /// Returns true when the key exists.
    func hasKey(_ key: Key) -> Bool {
        self[key] != nil
    }

    /// Returns a value for a key or nil.
    func getValue(forKey key: Key) -> Value? {
        self[key]
    }

    /// Returns a value or a supplied default.
    func getValueOrDefault(forKey key: Key, defaultValue: Value) -> Value {
        self[key] ?? defaultValue
    }

    /// Inserts or replaces a key-value pair.
    mutating func setValue(_ value: Value, forKey key: Key) {
        self[key] = value
    }

    /// Removes a value for a key.
    @discardableResult
    mutating func removeValue(forKey key: Key) -> Value? {
        let value = self[key]
        self[key] = nil
        return value
    }

    /// Returns all dictionary keys.
    func getAllKeys() -> [Key] {
        Array(keys)
    }

    /// Returns all dictionary values.
    func getAllValues() -> [Value] {
        Array(values)
    }

    /// Returns true when all values satisfy a condition.
    func allValuesMatch(
        _ predicate: (Value) throws -> Bool
    ) rethrows -> Bool {
        try values.allSatisfy(predicate)
    }

    /// Returns true when any value satisfies a condition.
    func anyValueMatches(
        _ predicate: (Value) throws -> Bool
    ) rethrows -> Bool {
        try values.contains(where: predicate)
    }

    /// Returns a mapped array of dictionary values.
    func mapValuesToArray<T>(
        _ transform: (Value) throws -> T
    ) rethrows -> [T] {
        try values.map(transform)
    }

    /// Returns a mapped array of dictionary keys.
    func mapKeysToArray<T>(
        _ transform: (Key) throws -> T
    ) rethrows -> [T] {
        try keys.map(transform)
    }

    /// Removes all dictionary entries.
    mutating func removeAllValues() {
        removeAll()
    }

    /// Returns a copy with a supplied key-value pair.
    func addingValue(_ value: Value, forKey key: Key) -> [Key: Value] {
        var copy = self
        copy[key] = value
        return copy
    }

    /// Returns a copy without a supplied key.
    func removingKey(_ key: Key) -> [Key: Value] {
        var copy = self
        copy.removeValue(forKey: key)
        return copy
    }

    /// Returns true when the dictionary contains exactly one entry.
    func hasSingleValue() -> Bool {
        count == 1
    }

    /// Returns the first key when available.
    func getFirstKey() -> Key? {
        first?.key
    }

    /// Returns the first value when available.
    func getFirstValue() -> Value? {
        first?.value
    }

    /// Returns all key-value pairs as an array.
    func getKeyValueArray() -> [(Key, Value)] {
        Array(self)
    }
}
