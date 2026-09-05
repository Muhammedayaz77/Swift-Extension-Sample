import Foundation

extension NSObject {

    /// Returns the runtime class name.
    func getClassName() -> String {
        return String(describing: type(of: self))
    }

    /// Returns the Objective-C class name.
    class func getTypeName() -> String {
        return String(describing: self)
    }

    /// Returns a string describing the object.
    func getObjectDescription() -> String {
        return String(describing: self)
    }

    /// Returns the object type.
    func getObjectType() -> Any.Type {
        return type(of: self)
    }

    /// Returns true when the object matches a type.
    func isObjectType<T>(_ type: T.Type) -> Bool {
        return self is T
    }

    /// Returns true when the object is the same instance.
    func isSameObject(_ object: AnyObject) -> Bool {
        return self === object
    }

    /// Returns a notification center instance.
    func getNotificationCenter() -> NotificationCenter {
        return .default
    }

    /// Posts a notification by name.
    func postNotification(_ name: String, userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(
            name: Notification.Name(name),
            object: self,
            userInfo: userInfo
        )
    }

    /// Returns a notification name.
    class func getNotificationName(_ suffix: String) -> Notification.Name {
        return Notification.Name(getTypeName() + "." + suffix)
    }

    /// Executes work on the main queue.
    func performOnMain(_ work: @escaping () -> Void) {
        DispatchQueue.main.async(execute: work)
    }

    /// Executes work after a delay.
    func performAfter(_ delay: TimeInterval, work: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: work)
    }

    /// Returns whether the object conforms to a protocol.
    func conformsTo(_ proto: Protocol) -> Bool {
        return class_conformsToProtocol(type(of: self), proto)
    }

    /// Returns whether the class is a subclass of another class.
    class func isSubclassOf(_ parent: AnyClass) -> Bool {
        return isSubclass(of: parent)
    }

    /// Returns the object hash value.
    func getHashValue() -> Int {
        return hash
    }

    /// Returns whether the object is equal to another object.
    func isEqualToObject(_ object: Any) -> Bool {
        return isEqual(object)
    }

    /// Returns a notification center default instance.
    class func getDefaultNotificationCenter() -> NotificationCenter {
        return .default
    }

    /// Returns the NSObject protocol description.
    func getProtocolDescription() -> String {
        return String(describing: self)
    }

    /// Returns the class type as AnyClass.
    class func getAnyClass() -> AnyClass {
        return self
    }

    /// Returns whether the object is a Foundation NSObject.
    func isFoundationObject() -> Bool {
        return true
    }

    /// Performs a block immediately.
    func performNow(_ work: () -> Void) {
        work()
    }
}
