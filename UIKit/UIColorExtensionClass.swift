import UIKit

extension UIColor {
    /// Creates a color from RGB values from 0 to 255.
    class func RGB(
        _ red: CGFloat,
        andGreenColor green: CGFloat,
        andBlueColor blue: CGFloat,
        withAlpha alpha: CGFloat = 1
    ) -> UIColor {
        UIColor(
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            alpha: alpha
        )
    }

    /// Creates a color from a hexadecimal string.
    class func colorWithHexString(_ hex: String) -> UIColor {
        let value = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")

        guard value.count == 6, let colorValue = Int(value, radix: 16) else {
            return .gray
        }

        return UIColor(
            red: CGFloat((colorValue >> 16) & 255) / 255,
            green: CGFloat((colorValue >> 8) & 255) / 255,
            blue: CGFloat(colorValue & 255) / 255,
            alpha: 1
        )
    }

    /// Returns the red component from the color.
    func getRedComponent() -> CGFloat {
        var red: CGFloat = 0
        getRed(&red, green: nil, blue: nil, alpha: nil)
        return red
    }

    /// Returns the green component from the color.
    func getGreenComponent() -> CGFloat {
        var green: CGFloat = 0
        getRed(nil, green: &green, blue: nil, alpha: nil)
        return green
    }

    /// Returns the blue component from the color.
    func getBlueComponent() -> CGFloat {
        var blue: CGFloat = 0
        getRed(nil, green: nil, blue: &blue, alpha: nil)
        return blue
    }

    /// Returns the alpha component from the color.
    func getAlphaComponent() -> CGFloat {
        var alpha: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &alpha)
        return alpha
    }

    /// Returns a copy with a new alpha value.
    func withAlpha(_ alpha: CGFloat) -> UIColor {
        withAlphaComponent(alpha)
    }

    /// Returns a lighter version of the color.
    func lighterColor(amount: CGFloat = 0.2) -> UIColor {
        adjustedColor(by: abs(amount))
    }

    /// Returns a darker version of the color.
    func darkerColor(amount: CGFloat = 0.2) -> UIColor {
        adjustedColor(by: -abs(amount))
    }

    private func adjustedColor(by amount: CGFloat) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return self
        }

        return UIColor(
            red: min(max(red + amount, 0), 1),
            green: min(max(green + amount, 0), 1),
            blue: min(max(blue + amount, 0), 1),
            alpha: alpha
        )
    }

    /// Returns a hexadecimal representation of the color.
    func getHexString() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return "#808080"
        }

        return String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(red * 255)),
            lroundf(Float(green * 255)),
            lroundf(Float(blue * 255))
        )
    }

    /// Returns a random opaque color.
    class func getRandomColor() -> UIColor {
        UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }

    /// Returns black or white based on perceived brightness.
    func getContrastingTextColor() -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return .white
        }

        return (0.299 * red + 0.587 * green + 0.114 * blue) > 0.6 ? .black : .white
    }

    /// Returns the color as a Core Graphics color.
    func getCGColor() -> CGColor {
        cgColor
    }

    /// Creates a color from grayscale and alpha values.
    class func grayColor(value: CGFloat, alpha: CGFloat = 1) -> UIColor {
        UIColor(white: value, alpha: alpha)
    }

    /// Returns a transparent version of the color.
    func transparentColor() -> UIColor {
        withAlphaComponent(0)
    }

    /// Returns a copy with its alpha reduced by a percentage.
    func fadedColor(_ amount: CGFloat = 0.5) -> UIColor {
        withAlphaComponent(
            max(0, min(1, getAlphaComponent() * (1 - amount)))
        )
    }

    /// Returns whether the color can be represented as RGB.
    func isRGBColor() -> Bool {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        return getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }

    /// Returns a copy with full opacity.
    func opaqueColor() -> UIColor {
        withAlphaComponent(1)
    }

    /// Returns a copy with half opacity.
    func halfTransparentColor() -> UIColor {
        withAlphaComponent(0.5)
    }

    /// Returns a copy with 25 percent opacity.
    func quarterTransparentColor() -> UIColor {
        withAlphaComponent(0.25)
    }
}
