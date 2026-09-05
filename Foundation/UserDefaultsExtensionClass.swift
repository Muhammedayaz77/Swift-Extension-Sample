import Foundation

extension UserDefaults {

    /// Saves a string value.
    func setString(_ value: String?, forKey key: String) {
        set(value, forKey: key)
    }

    /// Returns a string value.
    func getString(forKey key: String) -> String? {
        string(forKey: key)
    }

    /// Saves an integer value.
    func setInt(_ value: Int, forKey key: String) {
        set(value, forKey: key)
    }

    /// Returns an integer value.
    func getInt(forKey key: String) -> Int {
        integer(forKey: key)
    }

    /// Saves a Boolean value.
    func setBool(_ value: Bool, forKey key: String) {
        set(value, forKey: key)
    }

    /// Returns a Boolean value.
    func getBool(forKey key: String) -> Bool {
        bool(forKey: key)
    }

    /// Saves a Double value.
    func setDouble(_ value: Double, forKey key: String) {
        set(value, forKey: key)
    }

    /// Returns a Double value.
    func getDouble(forKey key: String) -> Double {
        double(forKey: key)
    }

    /// Saves Data.
    func setData(_ value: Data?, forKey key: String) {
        set(value, forKey: key)
    }

    /// Returns Data.
    func getData(forKey key: String) -> Data? {
        data(forKey: key)
    }

    /// Saves a URL.
    func setURLValue(_ value: URL?, forKey key: String) {
        set(value, forKey: key)
    }

    /// Returns a URL.
    func getURLValue(forKey key: String) -> URL? {
        url(forKey: key)
    }

    /// Saves an array.
    func setArray(_ value: [Any]?, forKey key: String) {
        set(value, forKey: key)
    }

    /// Returns an array.
    func getArray(forKey key: String) -> [Any]? {
        array(forKey: key)
    }

    /// Saves a dictionary.
    func setDictionary(_ value: [String: Any]?, forKey key: String) {
        set(value, forKey: key)
    }

    /// Returns a dictionary.
    func getDictionary(forKey key: String) -> [String: Any]? {
        dictionary(forKey: key)
    }

    /// Returns true when a key exists.
    func hasValue(forKey key: String) -> Bool {
        object(forKey: key) != nil
    }

    /// Removes a stored value.
    func removeValue(forKey key: String) {
        removeObject(forKey: key)
    }

    /// Removes multiple stored values.
    func removeValues(forKeys keys: [String]) {
        keys.forEach {
            removeObject(forKey: $0)
        }
    }

    /// Clears all values in the defaults suite.
    func removeAllValues() {
        dictionaryRepresentation().keys.forEach {
            removeObject(forKey: $0)
        }
    }
}
