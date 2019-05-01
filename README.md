# Swift-Extension-Sample
Some Swift Extension Samples are provided here 


        class ExtentionsClass: NSObject {
            
            // Screen width.
            public var screenWidth: CGFloat {
                return UIScreen.main.bounds.width
            }
            
            // Screen height.
            public var screenHeight: CGFloat {
                return UIScreen.main.bounds.height
            }
        }


        extension UIView {
            
            /// get top safe area height
            func getTopSafeArea() -> CGFloat {
                var topSafeArea: CGFloat
                if #available(iOS 11.0, *) {
                    topSafeArea = self.safeAreaInsets.top
                } else {
                    // Fallback on earlier versions
                    topSafeArea = 0
                }
                return topSafeArea
            }
            
            /// get Bottom safe area height
            func getBottomSafeArea() -> CGFloat {
                var bottomSafeArea: CGFloat
                if #available(iOS 11.0, *) {
                    bottomSafeArea = self.safeAreaInsets.bottom
                } else {
                    // Fallback on earlier versions
                    bottomSafeArea = 0
                }
                return bottomSafeArea
            }
            
            /// Sets rounded corners to the UIView
            func roundedCorners(radius: CGFloat? = nil) {
                if let radius = radius {
                    layer.cornerRadius = radius
                } else {
                    layer.cornerRadius = frame.size.height / 2
                }
                clipsToBounds = true
            }
            
            /// Sets border to the UIView
            func setViewBorder(withWidth width: CGFloat = 1.0, color: UIColor) {
                self.layer.borderWidth = width
                self.layer.borderColor = color.cgColor
            }
            
            /// Produce fade in animation
            func fadeIn(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
                UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                    self.alpha = 1.0
                }, completion: completion)
            }
            
            /// Produce fadeout animation
            func fadeOut(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
                UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
                    self.alpha = 0.0
                }, completion: completion)
            }
            
            
            /// Produce horizontal shake animation
            func shakeHorizontally(withCount count: Float = 4, duration: TimeInterval = 0.3, translation: Float = -10) {
                
                let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
                animation.repeatCount = count
                animation.duration = (duration)/TimeInterval(animation.repeatCount)
                animation.autoreverses = true
                animation.byValue = translation
                layer.add(animation, forKey: "shake")
                
            }
            
            /// Produce vertical shake animation
            func shakeVertically(withCount count: Float = 4, duration: TimeInterval = 0.3, translation: Float = -10) {
                
                let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.y")
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
                animation.repeatCount = count
                animation.duration = (duration)/TimeInterval(animation.repeatCount)
                animation.autoreverses = true
                animation.byValue = translation
                layer.add(animation, forKey: "shake")
                
            }
        }


        extension Array where Element: Equatable {
            mutating func removeDuplicates() {
                var result = [Element]()
                for value in self {
                    if !result.contains(value) {
                        result.append(value)
                    }
                }
                self = result
            }
        }


        extension String {
            
            func getLength() -> Int {
                let length = self.count
                return length
            }
            
            
            func replace(target: String, withString: String) -> String {
                return self.replacingOccurrences(of: target, with: withString)
            }
            
            func removeLeadingZeros() -> String {
                let trimmedString: String = (self as NSString).replacingOccurrences(of: "^0+", with: KEmptyString, options: .regularExpression, range: NSRange(location: 0, length: self.count))
                return trimmedString
            }
            
            func subStringInRange(from: Int, to: Int) -> String {
                let startIndex = self.index(self.startIndex, offsetBy: from)
                let endIndex = self.index(self.startIndex, offsetBy: to)
                return String(self[startIndex...endIndex])
            }
            
            func getSubStringWithCharacter (_ char: Character) -> String {
                var subString = ""
                for eachChar in self {
                    if eachChar == char {
                        return subString
                    } else {
                        subString += String(eachChar)
                    }
                }
                return subString
            }
            
            func getSubStringSeparatedByFirst (_ char: String) -> String {
                if let first = self.components(separatedBy: char).first {
                    return first
                }
                return ""
            }
            func componentsSeparatedByChar (_ char: String) -> NSArray {
                let array = self.components(separatedBy: char)
                return array as NSArray
            }
            
            
        }


        extension UIColor{
            //get new color from rgb value
            class func RGB(_ red:CGFloat , andGreenColor green:CGFloat, andBlueColor blue:CGFloat, withAlpha alpha:CGFloat) -> UIColor
            {
                let color = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
                return color
            }
            
            func colorWithHexString (hex:String) -> UIColor {
                
                var cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
                
                if (cString.hasPrefix("#")) {
                    cString = (cString as NSString).substring(from: 1)
                }
                
                if (cString.count != 6) {
                    return UIColor.gray
                }
                
                let rString = (cString as NSString).substring(to: 2)
                let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
                let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
                
                var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
                Scanner(string: rString).scanHexInt32(&r)
                Scanner(string: gString).scanHexInt32(&g)
                Scanner(string: bString).scanHexInt32(&b)
                
                
                return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
            }
        }


        extension UITextView {
            func resizeForHeight(){
                self.translatesAutoresizingMaskIntoConstraints = true
                self.sizeToFit()
                self.isScrollEnabled = false
            }
            
            
            func setWidthHeightOfTextviewInChatBubbel()  {
                let width = getWidthOfTextviewInChatBubbel()
                let newSize = self.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
                
                var newFrame : CGRect = self.frame
                newFrame.size = CGSize(width: width, height: newSize.height)
                self.frame = newFrame
            }
            
            
            
            func getHeightOfTextviewInChatBubbel() -> CGFloat  {
                let width = getWidthOfTextviewInChatBubbel()
                let newSize = self.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
                return newSize.height
            }
            
            func getWidthOfTextviewInChatBubbel () -> CGFloat {
                if self.intrinsicContentSize.width < 50  {
                    return 50
                } else if self.intrinsicContentSize.width > screenWidth-100 {
                    return screenWidth-100
                }
                return self.intrinsicContentSize.width
            }
            
            
            func padding(top:CGFloat,left:CGFloat,bottom:CGFloat,right:CGFloat) {
                self.textContainerInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
            }
            
        }

        extension UITextField{
            
            //set cornerRadius
            func cornerRadius(){
                self.layoutIfNeeded()
                self.layer.cornerRadius = self.frame.height / 2
                self.clipsToBounds = true
            }
            
            //set bordercolor
            func borderColor(){
                self.layer.borderColor = (UIColor .red as! CGColor) //Set some constact color here
                self.layer.borderWidth = 1.0
            }
            
            //set borderWidth
            func borderWidth(size:CGFloat){
                self.layer.borderWidth = size
            }
            
            //check textfield is blank
            func blank() -> Bool{
                if   self.text == nil {
                    return true
                } else {
                    return false
                }
            }
            
            //set begginning space - left space
            func setLeftPadding(paddingValue:CGFloat) {
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingValue, height: self.frame.size.height))
                self.leftViewMode = .always
                self.leftView = paddingView
            }
            
            //set end of space
            func setRightPadding(paddingValue:CGFloat){
                let paddingView = UIView(frame: CGRect(x: (self.frame.size.width - paddingValue), y: 0, width: paddingValue, height: self.frame.size.height))
                self.rightViewMode = .always
                self.rightView = paddingView
            }
            
            func useUnderline() {
                let border = CALayer()
                let borderWidth = CGFloat(1.0)
                border.borderColor = UIColor.lightGray.cgColor
                border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
                border.borderWidth = borderWidth
                self.layer.addSublayer(border)
                self.layer.masksToBounds = true
            }
        }


        extension UIFont{
            // Returns a scaled version of UIFont
            func scaled(scaleFactor: CGFloat) -> UIFont {
                let newDescriptor = fontDescriptor.withSize(fontDescriptor.pointSize * scaleFactor)
                return UIFont(descriptor: newDescriptor, size: 0)
            }
            
            
            /// SwifterSwift: Font as bold font
            var bold: UIFont {
                return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitBold)!, size: 0)
            }
            
            /// SwifterSwift: Font as italic font
            var italic: UIFont {
                return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitItalic)!, size: 0)
            }
            
            
        }

        extension UIImage {
            
            
            /// Returns the data for the specified image in JPEG format.
            /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
            /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
            //    func compressImage(_ jpegQuality: JPEGQuality) -> Data? {
            //        return jpegData(compressionQuality: jpegQuality.rawValue)
            //    }
            
            
            //convert image to base64 string
            func pngToBase64() -> String {
                let imageData: NSData = self.pngData()! as NSData
                return imageData.base64EncodedString(options: .lineLength64Characters)
            }
            
            //convert string to image
            class func base64ToImage(toImage strEncodeData: String) -> UIImage {
                let dataDecoded  = NSData(base64Encoded: strEncodeData, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!
                let image = UIImage(data: dataDecoded as Data)
                return image!
            }
            
            func getThumbnailImage (image : UIImage) -> UIImage {
                
                let imageData = image.pngData()!
                let options = [
                    kCGImageSourceCreateThumbnailWithTransform: true,
                    kCGImageSourceCreateThumbnailFromImageAlways: true,
                    kCGImageSourceThumbnailMaxPixelSize: 300] as CFDictionary
                let source = CGImageSourceCreateWithData(imageData as CFData, nil)!
                let imageReference = CGImageSourceCreateThumbnailAtIndex(source, 0, options)!
                let thumbnail = UIImage(cgImage: imageReference)
                return thumbnail
            }
            
            
            
            
            
            
            //function for resize image
            func resizeImage(targetSize: CGSize) -> UIImage {
                let size = self.size
                
                let widthRatio  = targetSize.width  / self.size.width
                let heightRatio = targetSize.height / self.size.height
                
                // Figure out what our orientation is, and use that to form the rectangle
                var newSize: CGSize
                if(widthRatio > heightRatio) {
                    newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
                } else {
                    //                        newSize = size
                    newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
                }
                
                // This is the rect that we've calculated out and this is what is actually used below
                let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
                
                // Actually do the resizing to the rect using the ImageContext stuff
                UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
                self.draw(in: rect)
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                return newImage!
            }
            
        }


        extension Date{
            
            //convert string to date
            static func convertStringToDate(strDate:String, dateFormate strFormate:String) -> Date{
                let dateFormate = DateFormatter()
                dateFormate.dateFormat = strFormate
                dateFormate.timeZone = TimeZone.init(abbreviation: "UTC")
                let dateResult:Date = dateFormate.date(from: strDate)!
                
                return dateResult
            }
            
            //Function for old date format to new format from UTC to local
            static func convertDateUTCToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
                let dateFormatterUTC:DateFormatter = DateFormatter()
                dateFormatterUTC.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone//set UTC timeZone
                dateFormatterUTC.dateFormat = strOldFormate //set old Format
                if let oldDate:Date = dateFormatterUTC.date(from: strDate)  as Date?//convert date from input string
                {
                    dateFormatterUTC.timeZone = NSTimeZone.local//set localtimeZone
                    dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
                    if let strNewDate:String = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
                    {
                        return strNewDate
                    }
                    return strDate
                }
                return strDate
            }
            
            //Convert without UTC to local
            static func convertDateToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
                let dateFormatterUTC:DateFormatter = DateFormatter()
                //set local timeZone
                dateFormatterUTC.dateFormat = strOldFormate //set old Format
                if let oldDate:Date = dateFormatterUTC.date(from: strDate) as Date?//convert date from input string
                {
                    dateFormatterUTC.timeZone = NSTimeZone.local
                    dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
                    if let strNewDate = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
                    {
                        return strNewDate
                    }
                    return strDate
                }
                return strDate
            }
            
            //Convert Date to String
            func convertDateToString(strDateFormate:String) -> String{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = strDateFormate
                let strDate = dateFormatter.string(from: self)
                //      dateFormatter = nil
                return strDate
            }
            
            
            //Convert local to utc
            static func convertLocalToUTC(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
                let dateFormatterUTC:DateFormatter = DateFormatter()
                dateFormatterUTC.timeZone = NSTimeZone.local as TimeZone?//set UTC timeZone
                dateFormatterUTC.dateFormat = strOldFormate //set old Format
                if let oldDate:Date = dateFormatterUTC.date(from: strDate)  as Date?//convert date from input string
                {
                    dateFormatterUTC.timeZone = NSTimeZone.init(abbreviation: "UTC")! as TimeZone//set localtimeZone
                    dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
                    if let strNewDate:String = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
                    {
                        return strNewDate
                    }
                    return strDate
                }
                return strDate
            }
            
            //Comparison two date
            static func compare(date:Date, compareDate:Date) -> String{
                var strDateMessage:String = ""
                let result:ComparisonResult = date.compare(compareDate)
                switch result {
                case .orderedAscending:
                    strDateMessage = "Future Date"
                    break
                case .orderedDescending:
                    strDateMessage = "Past Date"
                    break
                case .orderedSame:
                    strDateMessage = "Same Date"
                    break
                default:
                    strDateMessage = "Error Date"
                    break
                }
                return strDateMessage
            }
        }



        extension CustomAlertViewController   {
            
            func showAlert (Title title:String, Message message:String, ButtonTitle btnTitle:String,Tag tag:NSInteger, Controller controller:UIViewController) {
                //custom Alert
                let CustomAlertViewControllerObj = CustomAlertViewController(nibName: "CustomAlertViewController", bundle: nil)
                CustomAlertViewControllerObj.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
                CustomAlertViewControllerObj.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                CustomAlertViewControllerObj.titleStr = title
                CustomAlertViewControllerObj.messageStr = message
                CustomAlertViewControllerObj.okBtnTitleStr = btnTitle
                CustomAlertViewControllerObj.tag = tag
                CustomAlertViewControllerObj.delegate = (controller as! CustomAlertViewControllerDelegate)
                CustomAlertViewControllerObj.controllerSelf = controller
                controller.present(CustomAlertViewControllerObj, animated: true, completion: nil)
            }
            
            func showAlert (Title title:String, Message message:String, RightButtonTitle rBtnTitle:String, LeftTitle lBtnTitle:String ,Tag tag:NSInteger, Controller controller:UIViewController) {
                //custom Alert
                let CustomAlertViewControllerObj = CustomAlertViewController(nibName: "CustomAlertViewController", bundle: nil)
                CustomAlertViewControllerObj.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
                CustomAlertViewControllerObj.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                CustomAlertViewControllerObj.titleStr = title
                CustomAlertViewControllerObj.messageStr = message
                CustomAlertViewControllerObj.rightBtnTitleStr = rBtnTitle
                CustomAlertViewControllerObj.leftBtnTitleStr = lBtnTitle
                CustomAlertViewControllerObj.tag = tag
                CustomAlertViewControllerObj.delegate = (controller as! CustomAlertViewControllerDelegate)
                controller.present(CustomAlertViewControllerObj, animated: true, completion: nil)
            }
        }


        extension UIScreen {
            
            func widthOfSafeArea() -> CGFloat {
                
                guard let rootView = UIApplication.shared.keyWindow else { return 0 }
                
                if #available(iOS 11.0, *) {
                    
                    let leftInset = rootView.safeAreaInsets.left
                    
                    let rightInset = rootView.safeAreaInsets.right
                    
                    return rootView.bounds.width - leftInset - rightInset
                    
                } else {
                    
                    return rootView.bounds.width
                    
                }
                
            }
            
            func heightOfSafeArea() -> CGFloat {
                
                guard let rootView = UIApplication.shared.keyWindow else { return 0 }
                
                if #available(iOS 11.0, *) {
                    
                    let topInset = rootView.safeAreaInsets.top
                    
                    let bottomInset = rootView.safeAreaInsets.bottom
                    
                    return rootView.bounds.height - topInset - bottomInset
                    
                } else {
                    
                    return rootView.bounds.height
                    
                }
                
            }
            
        }

        extension Data {
            
            var uint8: UInt8 {
                get {
                    var number: UInt8 = 0
                    self.copyBytes(to:&number, count: MemoryLayout<UInt8>.size)
                    return number
                }
            }
            
            var uint16: UInt16 {
                get {
                    let i16array = self.withUnsafeBytes {
                        UnsafeBufferPointer<UInt16>(start: $0, count: self.count/2).map(UInt16.init(littleEndian:))
                    }
                    return i16array[0]
                }
            }
            
            var uint32: UInt32 {
                get {
                    let i32array = self.withUnsafeBytes {
                        UnsafeBufferPointer<UInt32>(start: $0, count: self.count/2).map(UInt32.init(littleEndian:))
                    }
                    return i32array[0]
                }
            }
            
            var uuid: NSUUID? {
                get {
                    var bytes = [UInt8](repeating: 0, count: self.count)
                    self.copyBytes(to:&bytes, count: self.count * MemoryLayout<UInt32>.size)
                    return NSUUID(uuidBytes: bytes)
                }
            }
            var stringASCII: String? {
                get {
                    return NSString(data: self, encoding: String.Encoding.ascii.rawValue) as String?
                }
            }
            
            var stringUTF8: String? {
                get {
                    return NSString(data: self, encoding: String.Encoding.utf8.rawValue) as String?
                }
            }
            
            struct HexEncodingOptions: OptionSet {
                let rawValue: Int
                static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
            }
            
            func hexEncodedString(options: HexEncodingOptions = []) -> String {
                let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
                return map { String(format: format, $0) }.joined()
            }
            
        }



        extension Int {
            var data: Data {
                var int = self
                return Data(bytes: &int, count: MemoryLayout<Int>.size)
            }
        }

        extension UInt8 {
            var data: Data {
                var int = self
                return Data(bytes: &int, count: MemoryLayout<UInt8>.size)
            }
        }

        extension UInt16 {
            var data: Data {
                var int = self
                return Data(bytes: &int, count: MemoryLayout<UInt16>.size)
            }
        }

        extension UInt32 {
            var data: Data {
                var int = self
                return Data(bytes: &int, count: MemoryLayout<UInt32>.size)
            }
            
            var byteArrayLittleEndian: [UInt8] {
                return [
                    UInt8((self & 0xFF000000) >> 24),
                    UInt8((self & 0x00FF0000) >> 16),
                    UInt8((self & 0x0000FF00) >> 8),
                    UInt8(self & 0x000000FF)
                ]
            }
        }


        extension Character {
            var byte: UInt8 {
                return String(self).utf8.map{UInt8($0)}[0]
            }
            
            var short: UInt16 {
                return String(self).utf16.map{UInt16($0)}[0]
            }
        }

        extension Sequence where Element == Character {  // Same as String
            var byteArray: [UInt8] {
                return String(self).utf8.map{UInt8($0)}
            }
            
            var shortArray: [UInt16] {
                return String(self).utf16.map{UInt16($0)}
            }
        }
