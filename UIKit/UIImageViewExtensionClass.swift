import UIKit

extension UIImageView {
    /// Sets corner radius.
    func setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }

    /// Makes the image view circular.
    func makeCircular() {
        layoutIfNeeded()
        setCornerRadius(min(bounds.width, bounds.height) / 2)
    }

    /// Sets a border.
    func setBorder(width: CGFloat = 1, color: UIColor = .lightGray) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    /// Adds a shadow.
    func setImageViewShadow(opacity: Float = 0.2, radius: CGFloat = 4) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }

    /// Removes the shadow.
    func removeImageViewShadow() {
        layer.shadowOpacity = 0
    }

    /// Sets aspect-fit content mode.
    func setAspectFit() {
        contentMode = .scaleAspectFit
    }

    /// Sets aspect-fill content mode.
    func setAspectFill() {
        contentMode = .scaleAspectFill
    }

    /// Sets scale-to-fill content mode.
    func setScaleToFill() {
        contentMode = .scaleToFill
    }

    /// Clears the image.
    func clearImage() {
        image = nil
    }

    /// Returns whether an image exists.
    func hasImage() -> Bool {
        image != nil
    }

    /// Returns image width.
    func getImageWidth() -> CGFloat {
        image?.size.width ?? 0
    }

    /// Returns image height.
    func getImageHeight() -> CGFloat {
        image?.size.height ?? 0
    }

    /// Sets an image and accessibility label.
    func setImage(_ image: UIImage?, accessibilityLabel: String? = nil) {
        self.image = image
        self.accessibilityLabel = accessibilityLabel
    }

    /// Fades the image view in.
    func fadeImageIn(_ duration: TimeInterval = 0.25) {
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }

    /// Fades the image view out.
    func fadeImageOut(_ duration: TimeInterval = 0.25) {
        UIView.animate(withDuration: duration) {
            self.alpha = 0
        }
    }

    /// Sets image view opacity.
    func setImageOpacity(_ value: Float) {
        alpha = CGFloat(max(0, min(1, value)))
    }

    /// Applies rounded corners using the current height.
    func setPillCorners() {
        layoutIfNeeded()
        setCornerRadius(bounds.height / 2)
    }

    /// Hides the image view.
    func hideImageView() {
        isHidden = true
    }

    /// Shows the image view.
    func showImageView() {
        isHidden = false
    }

    /// Returns the current image if available.
    func getImage() -> UIImage? {
        image
    }
}
