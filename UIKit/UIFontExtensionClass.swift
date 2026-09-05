import UIKit

extension UIFont {

    /// Returns a scaled version of the font.
    func scaled(scaleFactor: CGFloat) -> UIFont {
        return UIFont(descriptor: fontDescriptor.withSize(pointSize * scaleFactor), size: 0)
    }

    /// Returns the font as bold.
    var bold: UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitBold) ?? fontDescriptor, size: 0)
    }

    /// Returns the font as italic.
    var italic: UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitItalic) ?? fontDescriptor, size: 0)
    }

    /// Returns the font as bold italic.
    var boldItalic: UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits([.traitBold, .traitItalic]) ?? fontDescriptor, size: 0)
    }

    /// Returns the font with a new point size.
    func withSize(_ size: CGFloat) -> UIFont {
        return UIFont(descriptor: fontDescriptor, size: size)
    }

    /// Returns a smaller font by the supplied amount.
    func smaller(by value: CGFloat = 1) -> UIFont {
        return withSize(max(1, pointSize - value))
    }

    /// Returns a larger font by the supplied amount.
    func larger(by value: CGFloat = 1) -> UIFont {
        return withSize(pointSize + value)
    }

    /// Returns the font point size.
    func getFontSize() -> CGFloat {
        return pointSize
    }

    /// Returns the font family name.
    func getFamilyName() -> String {
        return familyName
    }

    /// Returns the font name.
    func getFontName() -> String {
        return fontName
    }

    /// Returns whether the font is bold.
    func isBoldFont() -> Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    /// Returns whether the font is italic.
    func isItalicFont() -> Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

    /// Returns a semibold version of the font.
    var semiBold: UIFont {
        return UIFont.systemFont(ofSize: pointSize, weight: .semibold)
    }

    /// Returns a medium version of the font.
    var medium: UIFont {
        return UIFont.systemFont(ofSize: pointSize, weight: .medium)
    }

    /// Returns a light version of the font.
    var light: UIFont {
        return UIFont.systemFont(ofSize: pointSize, weight: .light)
    }

    /// Returns an ultralight version of the font.
    var ultraLight: UIFont {
        return UIFont.systemFont(ofSize: pointSize, weight: .ultraLight)
    }

    /// Returns a heavy version of the font.
    var heavy: UIFont {
        return UIFont.systemFont(ofSize: pointSize, weight: .heavy)
    }

    /// Returns a thin version of the font.
    var thin: UIFont {
        return UIFont.systemFont(ofSize: pointSize, weight: .thin)
    }

    /// Returns a regular system font at the current size.
    var regular: UIFont {
        return UIFont.systemFont(ofSize: pointSize, weight: .regular)
    }
}
