import Foundation

extension Data {
    /// Returns the data as a UTF-8 string.
    func getUTF8String()->String?{String(data:self,encoding:.utf8)}
    /// Returns a Base64 encoded string.
    func getBase64String()->String{base64EncodedString()}
    /// Creates Data from a Base64 string.
    static func fromBase64String(_ value:String)->Data?{Data(base64Encoded:value)}
    /// Converts JSON data to a dictionary.
    func getJSONDictionary()->[String:Any]?{(try? JSONSerialization.jsonObject(with:self)) as? [String:Any]}
    /// Converts JSON data to an array.
    func getJSONArray()->[Any]?{(try? JSONSerialization.jsonObject(with:self)) as? [Any]}
    /// Converts a JSON-compatible value to Data.
    static func fromJSONObject(_ object:Any)->Data?{try? JSONSerialization.data(withJSONObject:object,options:[])}
    /// Returns a hexadecimal string.
    func getHexString()->String{map{String(format:"%02x",$0)}.joined()}
    /// Returns data length in bytes.
    func getByteCount()->Int{count}
    /// Returns whether data is empty.
    func isEmptyData()->Bool{isEmpty}
    /// Returns whether data starts with a byte sequence.
    func startsWith(_ prefix:[UInt8])->Bool{self.starts(with:prefix)}
    /// Returns a copy with bytes reversed.
    func reversedData()->Data{Data(reversed())}
    /// Returns a subrange safely.
    func getSubData(from:Int,length:Int)->Data{guard from>=0,length>=0,from<count else{return Data()};return subdata(in:from..<min(count,from+length))}
    /// Returns the first byte.
    func getFirstByte()->UInt8?{first}
    /// Returns the last byte.
    func getLastByte()->UInt8?{last}
    /// Returns true when data can be decoded as UTF-8.
    func isValidUTF8()->Bool{getUTF8String() != nil}
    /// Writes data to a URL.
    func saveToURL(_ url:URL)->Bool{(try? write(to:url)) != nil}
    /// Reads a UTF-8 string after trimming whitespace.
    func getTrimmedUTF8String()->String?{getUTF8String()?.trimmingCharacters(in:.whitespacesAndNewlines)}
    /// Returns JSON data as a pretty printed string.
    func getPrettyJSONString()->String?{guard let o=try? JSONSerialization.jsonObject(with:self),let d=try? JSONSerialization.data(withJSONObject:o,options:.prettyPrinted) else{return nil};return String(data:d,encoding:.utf8)}
    /// Returns a Data copy.
    func copyData()->Data{Data(self)}
    /// Returns whether the data contains a byte.
    func containsByte(_ byte:UInt8)->Bool{contains(byte)}
}
