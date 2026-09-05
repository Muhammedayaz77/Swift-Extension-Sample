import UIKit

extension UITextView {

    /// Resizes the text view to fit its content.
    func resizeForHeight() {
        translatesAutoresizingMaskIntoConstraints = true
        sizeToFit()
        isScrollEnabled = false
    }

    /// Sets text view padding.
    func padding(
        top: CGFloat,
        left: CGFloat,
        bottom: CGFloat,
        right: CGFloat
    ) {
        textContainerInset = UIEdgeInsets(
            top: top,
            left: left,
            bottom: bottom,
            right: right
        )
    }

    /// Returns text length.
    func getTextLength() -> Int {
        text.count
    }

    /// Returns true when text is blank.
    func isBlankText() -> Bool {
        text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    /// Clears text.
    func clearText() {
        text = ""
    }

    /// Sets text.
    func setText(_ value: String) {
        text = value
    }

    /// Sets text color.
    func setTextColor(_ color: UIColor) {
        textColor = color
    }

    /// Sets font.
    func setTextFont(_ font: UIFont) {
        self.font = font
    }

    /// Centers text.
    func setTextCenter() {
        textAlignment = .center
    }

    /// Aligns text left.
    func setTextLeft() {
        textAlignment = .left
    }

    /// Aligns text right.
    func setTextRight() {
        textAlignment = .right
    }

    /// Sets corner radius.
    func setTextViewCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }

    /// Sets border.
    func setTextViewBorder(
        width: CGFloat = 1,
        color: UIColor = .lightGray
    ) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    /// Enables scrolling.
    func enableScrolling() {
        isScrollEnabled = true
    }

    /// Disables scrolling.
    func disableScrolling() {
        isScrollEnabled = false
    }

    /// Shows the text view.
    func showTextView() {
        isHidden = false
    }

    /// Hides the text view.
    func hideTextView() {
        isHidden = true
    }

    /// Returns the text view width.
    func getTextViewWidth() -> CGFloat {
        bounds.width
    }

    /// Returns the text view height.
    func getTextViewHeight() -> CGFloat {
        bounds.height
    }
}
