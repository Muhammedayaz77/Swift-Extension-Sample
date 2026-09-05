import UIKit

extension UIScreen {

    /// Returns screen bounds.
    class func getScreenBounds() -> CGRect {
        main.bounds
    }

    /// Returns screen width.
    class func getScreenWidth() -> CGFloat {
        main.bounds.width
    }

    /// Returns screen height.
    class func getScreenHeight() -> CGFloat {
        main.bounds.height
    }

    /// Returns screen scale.
    class func getScreenScale() -> CGFloat {
        main.scale
    }

    /// Returns native screen scale.
    class func getNativeScale() -> CGFloat {
        main.nativeScale
    }

    /// Returns native screen bounds.
    class func getNativeBounds() -> CGRect {
        main.nativeBounds
    }

    /// Returns native screen width.
    class func getNativeWidth() -> CGFloat {
        main.nativeBounds.width
    }

    /// Returns native screen height.
    class func getNativeHeight() -> CGFloat {
        main.nativeBounds.height
    }

    /// Returns screen aspect ratio.
    class func getAspectRatio() -> CGFloat {
        main.bounds.height == 0 ? 0 : main.bounds.width / main.bounds.height
    }

    /// Returns whether the screen is portrait.
    class func isPortraitScreen() -> Bool {
        main.bounds.width < main.bounds.height
    }

    /// Returns whether the screen is landscape.
    class func isLandscapeScreen() -> Bool {
        main.bounds.width > main.bounds.height
    }

    /// Returns the longest screen dimension.
    class func getLongestSide() -> CGFloat {
        max(getScreenWidth(), getScreenHeight())
    }

    /// Returns the shortest screen dimension.
    class func getShortestSide() -> CGFloat {
        min(getScreenWidth(), getScreenHeight())
    }

    /// Returns screen center point.
    class func getScreenCenter() -> CGPoint {
        CGPoint(x: getScreenWidth() / 2, y: getScreenHeight() / 2)
    }

    /// Returns a quarter of screen width.
    class func getQuarterWidth() -> CGFloat {
        getScreenWidth() / 4
    }

    /// Returns half screen width.
    class func getHalfWidth() -> CGFloat {
        getScreenWidth() / 2
    }

    /// Returns half screen height.
    class func getHalfHeight() -> CGFloat {
        getScreenHeight() / 2
    }

    /// Returns quarter screen height.
    class func getQuarterHeight() -> CGFloat {
        getScreenHeight() / 4
    }

    /// Returns whether scale is Retina-level.
    class func isRetinaScreen() -> Bool {
        main.scale >= 2
    }

    /// Returns a size using screen dimensions.
    class func getScreenSize() -> CGSize {
        main.bounds.size
    }

    /// Returns screen diagonal approximation.
    class func getDiagonalLength() -> CGFloat {
        hypot(getScreenWidth(), getScreenHeight())
    }
}
