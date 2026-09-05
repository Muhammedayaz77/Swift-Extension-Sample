import UIKit

extension UIColor {
    /// Creates a color from RGB values from 0 to 255.
    class func RGB(_ red: CGFloat, andGreenColor green: CGFloat, andBlueColor blue: CGFloat, withAlpha alpha: CGFloat = 1) -> UIColor { UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha) }
    /// Creates a color from a hexadecimal string.
    class func colorWithHexString(_ hex: String) -> UIColor { let h = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: ""); guard h.count == 6, let v = Int(h, radix: 16) else { return .gray }; return UIColor(red: CGFloat((v >> 16) & 255)/255, green: CGFloat((v >> 8) & 255)/255, blue: CGFloat(v & 255)/255, alpha: 1) }
    /// Returns the red component from the color.
    func getRedComponent() -> CGFloat { var r: CGFloat = 0; getRed(&r, green: nil, blue: nil, alpha: nil); return r }
    /// Returns the green component from the color.
    func getGreenComponent() -> CGFloat { var g: CGFloat = 0; getRed(nil, green: &g, blue: nil, alpha: nil); return g }
    /// Returns the blue component from the color.
    func getBlueComponent() -> CGFloat { var b: CGFloat = 0; getRed(nil, green: nil, blue: &b, alpha: nil); return b }
    /// Returns the alpha component from the color.
    func getAlphaComponent() -> CGFloat { var a: CGFloat = 0; getRed(nil, green: nil, blue: nil, alpha: &a); return a }
    /// Returns a copy with a new alpha value.
    func withAlpha(_ alpha: CGFloat) -> UIColor { withAlphaComponent(alpha) }
    /// Returns a lighter version of the color.
    func lighterColor(amount: CGFloat = 0.2) -> UIColor { adjustedColor(by: abs(amount)) }
    /// Returns a darker version of the color.
    func darkerColor(amount: CGFloat = 0.2) -> UIColor { adjustedColor(by: -abs(amount)) }
    private func adjustedColor(by amount: CGFloat) -> UIColor { var r: CGFloat=0,g: CGFloat=0,b: CGFloat=0,a: CGFloat=0; guard getRed(&r,green:&g,blue:&b,alpha:&a) else{return self}; return UIColor(red:min(max(r+amount,0),1),green:min(max(g+amount,0),1),blue:min(max(b+amount,0),1),alpha:a) }
    /// Returns a hexadecimal representation of the color.
    func getHexString() -> String { var r:CGFloat=0,g:CGFloat=0,b:CGFloat=0,a:CGFloat=0; guard getRed(&r,green:&g,blue:&b,alpha:&a) else{return "#808080"}; return String(format:"#%02lX%02lX%02lX", lroundf(Float(r*255)),lroundf(Float(g*255)),lroundf(Float(b*255))) }
    /// Returns a random opaque color.
    class func getRandomColor() -> UIColor { UIColor(red:.random(in:0...1),green:.random(in:0...1),blue:.random(in:0...1),alpha:1) }
    /// Returns black or white based on perceived brightness.
    func getContrastingTextColor() -> UIColor { var r:CGFloat=0,g:CGFloat=0,b:CGFloat=0,a:CGFloat=0; guard getRed(&r,green:&g,blue:&b,alpha:&a) else{return .white}; return (0.299*r+0.587*g+0.114*b) > 0.6 ? .black : .white }
    /// Returns the color as a Core Graphics color.
    func getCGColor() -> CGColor { cgColor }
    /// Creates a color from grayscale and alpha values.
    class func grayColor(value: CGFloat, alpha: CGFloat = 1) -> UIColor { UIColor(white:value,alpha:alpha) }
    /// Returns a transparent version of the color.
    func transparentColor() -> UIColor { withAlphaComponent(0) }
    /// Returns a copy with its alpha reduced by a percentage.
    func fadedColor(_ amount: CGFloat = 0.5) -> UIColor { withAlphaComponent(max(0, min(1, getAlphaComponent() * (1-amount)))) }
    /// Returns whether the color can be represented as RGB.
    func isRGBColor() -> Bool { var r:CGFloat=0,g:CGFloat=0,b:CGFloat=0,a:CGFloat=0; return getRed(&r,green:&g,blue:&b,alpha:&a) }
    /// Returns a copy with full opacity.
    func opaqueColor() -> UIColor { withAlphaComponent(1) }
    /// Returns a copy with half opacity.
    func halfTransparentColor() -> UIColor { withAlphaComponent(0.5) }
    /// Returns a copy with 25 percent opacity.
    func quarterTransparentColor() -> UIColor { withAlphaComponent(0.25) }
}
