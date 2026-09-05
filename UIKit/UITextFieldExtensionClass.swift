import UIKit

extension UITextField {

    /// Sets rounded corners.
    func cornerRadius() {
        layoutIfNeeded()
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }

    /// Sets border color.
    func setBorderColor(_ color: UIColor) {
        layer.borderColor = color.cgColor
    }

    /// Sets border width.
    func borderWidth(size: CGFloat) {
        layer.borderWidth = size
    }

    /// Returns true when the text field is blank.
    func blank() -> Bool {
        text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true
    }

    /// Adds left padding.
    func setLeftPadding(paddingValue: CGFloat) {
        leftView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: paddingValue,
                height: frame.height
            )
        )
        leftViewMode = .always
    }

    /// Adds right padding.
    func setRightPadding(paddingValue: CGFloat) {
        rightView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: paddingValue,
                height: frame.height
            )
        )
        rightViewMode = .always
    }

    /// Adds an underline.
    func useUnderline(color: UIColor = .lightGray, width: CGFloat = 1) {
        let layer = CALayer()
        layer.backgroundColor = color.cgColor
        layer.frame = CGRect(
            x: 0,
            y: bounds.height - width,
            width: bounds.width,
            height: width
        )
        self.layer.addSublayer(layer)
    }

    /// Clears the text.
    func clearText() {
        text = ""
    }

    /// Sets placeholder text.
    func setPlaceholder(_ value: String) {
        placeholder = value
    }

    /// Sets text color.
    func setFieldTextColor(_ color: UIColor) {
        textColor = color
    }

    /// Sets field font.
    func setFieldFont(_ font: UIFont) {
        self.font = font
    }

    /// Returns text length.
    func getTextLength() -> Int {
        text?.count ?? 0
    }

    /// Returns true when the field has text.
    func hasTextValue() -> Bool {
        !(text ?? "").isEmpty
    }

    /// Sets secure text entry.
    func setSecureEntry(_ enabled: Bool = true) {
        isSecureTextEntry = enabled
    }

    /// Sets keyboard type.
    func setKeyboardType(_ type: UIKeyboardType) {
        keyboardType = type
    }

    /// Sets return key type.
    func setReturnKeyType(_ type: UIReturnKeyType) {
        returnKeyType = type
    }

    /// Shows the keyboard.
    func showKeyboard() {
        becomeFirstResponder()
    }

    /// Hides the keyboard.
    func hideKeyboard() {
        resignFirstResponder()
    }

    /// Sets corner and border styling together.
    func setFieldStyle(
        radius: CGFloat = 8,
        borderColor: UIColor = .lightGray,
        borderWidth: CGFloat = 1
    ) {
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
    }
}
