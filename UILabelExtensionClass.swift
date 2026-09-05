import UIKit

extension UILabel {
    /// Sets the label text.
    func setLabelText(_ text: String?) { self.text=text }
    /// Sets text and font together.
    func setText(_ text: String?, font: UIFont) { self.text=text; self.font=font }
    /// Sets text color.
    func setTextColor(_ color: UIColor) { textColor=color }
    /// Sets font.
    func setLabelFont(_ font: UIFont) { self.font=font }
    /// Centers the text.
    func setTextCenter() { textAlignment=.center }
    /// Aligns text to the left.
    func setTextLeft() { textAlignment=.left }
    /// Aligns text to the right.
    func setTextRight() { textAlignment=.right }
    /// Makes text bold.
    func makeBold() { font=font.bold }
    /// Makes text italic.
    func makeItalic() { font=font.italic }
    /// Sets the number of lines.
    func setNumberOfLines(_ lines: Int) { numberOfLines=lines }
    /// Returns the current text length.
    func getTextLength() -> Int { text?.count ?? 0 }
    /// Returns true when the label has no text.
    func isTextEmpty() -> Bool { text?.isEmpty ?? true }
    /// Adds a background color.
    func setLabelBackgroundColor(_ color: UIColor) { backgroundColor=color }
    /// Sets corner radius.
    func setLabelCornerRadius(_ radius: CGFloat) { layer.cornerRadius=radius; clipsToBounds=true }
    /// Sets line break mode.
    func setWordWrap() { lineBreakMode=.byWordWrapping }
    /// Sets truncation at the end.
    func setTailTruncation() { lineBreakMode=.byTruncatingTail }
    /// Hides the label.
    func hideLabel() { isHidden=true }
    /// Shows the label.
    func showLabel() { isHidden=false }
    /// Returns the label's intrinsic width.
    func getIntrinsicWidth() -> CGFloat { intrinsicContentSize.width }
    /// Returns the label's intrinsic height.
    func getIntrinsicHeight() -> CGFloat { intrinsicContentSize.height }
}
