import UIKit

extension UIButton {

    /// Sets button title.
    func setButtonTitle(_ title: String?, for state: UIControl.State = .normal) {
        setTitle(title, for: state)
    }

    /// Sets button title color.
    func setButtonTitleColor(_ color: UIColor, for state: UIControl.State = .normal) {
        setTitleColor(color, for: state)
    }

    /// Sets button image.
    func setButtonImage(_ image: UIImage?, for state: UIControl.State = .normal) {
        setImage(image, for: state)
    }

    /// Sets button font.
    func setButtonFont(_ font: UIFont) {
        titleLabel?.font = font
    }

    /// Sets corner radius.
    func setButtonCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }

    /// Makes the button circular.
    func makeButtonCircular() {
        layoutIfNeeded()
        setButtonCornerRadius(min(bounds.width, bounds.height) / 2)
    }

    /// Sets a button border.
    func setButtonBorder(width: CGFloat = 1, color: UIColor = .lightGray) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    /// Enables the button.
    func enableButton() {
        isEnabled = true
    }

    /// Disables the button.
    func disableButton() {
        isEnabled = false
    }

    /// Shows the button.
    func showButton() {
        isHidden = false
    }

    /// Hides the button.
    func hideButton() {
        isHidden = true
    }

    /// Returns button title.
    func getButtonTitle() -> String {
        return title(for: .normal) ?? ""
    }

    /// Returns button title length.
    func getButtonTitleLength() -> Int {
        return getButtonTitle().count
    }

    /// Sets button background color.
    func setButtonBackgroundColor(_ color: UIColor) {
        backgroundColor = color
    }

    /// Sets button content alignment.
    func setButtonAlignment(_ alignment: UIControl.ContentHorizontalAlignment) {
        contentHorizontalAlignment = alignment
    }

    /// Adds button corner shadow.
    func setButtonShadow(opacity: Float = 0.2, radius: CGFloat = 4) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }

    /// Removes button shadow.
    func removeButtonShadow() {
        layer.shadowOpacity = 0
    }

    /// Fades button in.
    func fadeButtonIn(_ duration: TimeInterval = 0.25) {
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }

    /// Fades button out.
    func fadeButtonOut(_ duration: TimeInterval = 0.25) {
        UIView.animate(withDuration: duration) {
            self.alpha = 0
        }
    }
}
