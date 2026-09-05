import UIKit

extension UIView {
    /// Returns the top safe-area inset.
    func getTopSafeArea() -> CGFloat { safeAreaInsets.top }
    /// Returns the bottom safe-area inset.
    func getBottomSafeArea() -> CGFloat { safeAreaInsets.bottom }
    /// Sets corner radius or makes the view circular when radius is nil.
    func roundedCorners(radius: CGFloat? = nil) { layer.cornerRadius = radius ?? frame.height/2; clipsToBounds = true }
    /// Sets border width and color.
    func setViewBorder(withWidth width: CGFloat = 1, color: UIColor) { layer.borderWidth=width; layer.borderColor=color.cgColor }
    /// Fades the view in.
    func fadeIn(_ duration: TimeInterval=1, completion: ((Bool)->Void)?=nil) { UIView.animate(withDuration:duration,animations:{self.alpha=1},completion:completion) }
    /// Fades the view out.
    func fadeOut(_ duration: TimeInterval=1, completion: ((Bool)->Void)?=nil) { UIView.animate(withDuration:duration,animations:{self.alpha=0},completion:completion) }
    /// Animates a horizontal shake.
    func shakeHorizontally(withCount count: Float=4) { let a=CABasicAnimation(keyPath:"transform.translation.x"); a.repeatCount=count; a.autoreverses=true; a.fromValue=-10; a.toValue=10; layer.add(a,forKey:"shake") }
    /// Animates a vertical shake.
    func shakeVertically(withCount count: Float=4) { let a=CABasicAnimation(keyPath:"transform.translation.y"); a.repeatCount=count; a.autoreverses=true; a.fromValue=-10; a.toValue=10; layer.add(a,forKey:"shake") }
    /// Adds a shadow to the view.
    func setShadow(color: UIColor=.black, opacity: Float=0.2, radius: CGFloat=4, offset: CGSize=CGSize(width:0,height:2)) { layer.shadowColor=color.cgColor; layer.shadowOpacity=opacity; layer.shadowRadius=radius; layer.shadowOffset=offset }
    /// Removes the layer shadow.
    func removeShadow() { layer.shadowOpacity=0 }
    /// Hides the view.
    func showView() { isHidden=false }
    /// Shows the view.
    func hideView() { isHidden=true }
    /// Removes all subviews.
    func removeAllSubviews() { subviews.forEach{$0.removeFromSuperview()} }
    /// Adds a corner radius to selected corners.
    func setCornerRadius(_ radius: CGFloat) { layer.cornerRadius=radius; clipsToBounds=true }
    /// Returns the view width.
    func getWidth() -> CGFloat { frame.width }
    /// Returns the view height.
    func getHeight() -> CGFloat { frame.height }
    /// Returns the view center x position.
    func getCenterX() -> CGFloat { center.x }
    /// Returns the view center y position.
    func getCenterY() -> CGFloat { center.y }
    /// Brings the view to the front of its superview.
    func bringToFront() { superview?.bringSubviewToFront(self) }
    /// Sends the view behind other sibling views.
    func sendToBack() { superview?.sendSubviewToBack(self) }
}
