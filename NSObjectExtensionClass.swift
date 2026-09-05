import Foundation

extension NSObject {
    /// Returns the runtime class name.
    func getClassName()->String{String(describing:type(of:self))}
    /// Returns the Objective-C class name.
    class func getTypeName()->String{String(describing:self)}
    /// Returns a string describing the object.
    func getObjectDescription()->String{String(describing:self)}
    /// Returns the object type.
    func getObjectType()->Any.Type{type(of:self)}
    /// Returns true when the object matches a type.
    func isObjectType<T>(_ type:T.Type)->Bool{self is T}
    /// Returns true when the object is the same instance.
    func isSameObject(_ object:AnyObject)->Bool{self === object}
    /// Returns a notification center instance.
    func getNotificationCenter()->NotificationCenter{.default}
    /// Posts a notification by name.
    func postNotification(_ name:String,userInfo:[AnyHashable:Any]?=nil){NotificationCenter.default.post(name:Notification.Name(name),object:self,userInfo:userInfo)}
    /// Returns a notification name.
    class func getNotificationName(_ suffix:String)->Notification.Name{Notification.Name(getTypeName()+"."+suffix)}
    /// Executes work on the main queue.
    func performOnMain(_ work:@escaping()->Void){DispatchQueue.main.async(execute:work)}
    /// Executes work after a delay.
    func performAfter(_ delay:TimeInterval,work:@escaping()->Void){DispatchQueue.main.asyncAfter(deadline:.now()+delay,execute:work)}
    /// Returns whether the object conforms to a protocol.
    func conformsTo(_ proto:Protocol)->Bool{class_conformsToProtocol(type(of:self),proto)}
    /// Returns whether the class is a subclass of another class.
    class func isSubclassOf(_ parent:AnyClass)->Bool{isSubclass(of:parent)}
    /// Returns the object hash value.
    func getHashValue()->Int{hash}
    /// Returns whether the object is equal to another object.
    func isEqualToObject(_ object:Any)->Bool{isEqual(object)}
    /// Returns a notification center default instance.
    class func getDefaultNotificationCenter()->NotificationCenter{.default}
    /// Returns the NSObject protocol description.
    func getProtocolDescription()->String{String(describing:self)}
    /// Returns the class type as AnyClass.
    class func getAnyClass()->AnyClass{self}
    /// Returns whether the object is a Foundation NSObject.
    func isFoundationObject()->Bool{true}
    /// Performs a block immediately.
    func performNow(_ work:()->Void){work()}
}
