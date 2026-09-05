import UIKit

extension UIFont {
    /// Returns a scaled version of the font.
    func scaled(scaleFactor: CGFloat) -> UIFont { UIFont(descriptor: fontDescriptor.withSize(pointSize * scaleFactor), size: 0) }
    /// Returns the font as bold.
    var bold: UIFont { UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitBold) ?? fontDescriptor, size: 0) }
    /// Returns the font as italic.
    var italic: UIFont { UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitItalic) ?? fontDescriptor, size: 0) }
    /// Returns the font as bold italic.
    var boldItalic: UIFont { UIFont(descriptor: fontDescriptor.withSymbolicTraits([.traitBold,.traitItalic]) ?? fontDescriptor, size: 0) }
    /// Returns the font with a new point size.
    func withFontSize(_ size: CGFloat) -> UIFont { UIFont(descriptor: fontDescriptor.withSize(size), size: 0) }
    /// Returns a smaller font by the supplied amount.
    func smaller(by value: CGFloat = 1) -> UIFont { withFontSize(max(1, pointSize-value)) }
    /// Returns a larger font by the supplied amount.
    func larger(by value: CGFloat = 1) -> UIFont { withFontSize(pointSize+value) }
    /// Returns the font point size.
    func getFontSize() -> CGFloat { pointSize }
    /// Returns the font family name.
    func getFamilyName() -> String { familyName }
    /// Returns the font name.
    func getFontName() -> String { fontName }
    /// Returns whether the font is bold.
    func isBoldFont() -> Bool { fontDescriptor.symbolicTraits.contains(.traitBold) }
    /// Returns whether the font is italic.
    func isItalicFont() -> Bool { fontDescriptor.symbolicTraits.contains(.traitItalic) }
    /// Returns a semibold system font at the current size.
    var semiBold: UIFont { UIFont.systemFont(ofSize: pointSize, weight: .semibold) }
    /// Returns a medium system font at the current size.
    var medium: UIFont { UIFont.systemFont(ofSize: pointSize, weight: .medium) }
    /// Returns a light system font at the current size.
    var light: UIFont { UIFont.systemFont(ofSize: pointSize, weight: .light) }
    /// Returns an ultralight system font at the current size.
    var ultraLight: UIFont { UIFont.systemFont(ofSize: pointSize, weight: .ultraLight) }
    /// Returns a heavy system font at the current size.
    var heavy: UIFont { UIFont.systemFont(ofSize: pointSize, weight: .heavy) }
    /// Returns a thin system font at the current size.
    var thin: UIFont { UIFont.systemFont(ofSize: pointSize, weight: .thin) }
    /// Returns a regular system font at the current size.
    var regular: UIFont { UIFont.systemFont(ofSize: pointSize, weight: .regular) }
}
