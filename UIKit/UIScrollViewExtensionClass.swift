import UIKit

extension UIScrollView {
    /// Scrolls to the top.
    func scrollToTop(animated:Bool=true){setContentOffset(CGPoint(x:contentOffset.x,y:-adjustedContentInset.top),animated:animated)}
    /// Scrolls to the bottom.
    func scrollToBottom(animated:Bool=true){let y=max(-adjustedContentInset.top,contentSize.height-bounds.height+adjustedContentInset.bottom);setContentOffset(CGPoint(x:contentOffset.x,y:y),animated:animated)}
    /// Scrolls to the left.
    func scrollToLeft(animated:Bool=true){setContentOffset(CGPoint(x:-adjustedContentInset.left,y:contentOffset.y),animated:animated)}
    /// Scrolls to the right.
    func scrollToRight(animated:Bool=true){let x=max(-adjustedContentInset.left,contentSize.width-bounds.width+adjustedContentInset.right);setContentOffset(CGPoint(x:x,y:contentOffset.y),animated:animated)}
    /// Returns current vertical offset.
    func getVerticalOffset()->CGFloat{contentOffset.y}
    /// Returns current horizontal offset.
    func getHorizontalOffset()->CGFloat{contentOffset.x}
    /// Returns content width.
    func getContentWidth()->CGFloat{contentSize.width}
    /// Returns content height.
    func getContentHeight()->CGFloat{contentSize.height}
    /// Enables bouncing.
    func enableBouncing(){bounces=true}
    /// Disables bouncing.
    func disableBouncing(){bounces=false}
    /// Enables vertical scrolling.
    func enableVerticalScroll(){isScrollEnabled=true;showsVerticalScrollIndicator=true}
    /// Hides vertical indicator.
    func hideVerticalIndicator(){showsVerticalScrollIndicator=false}
    /// Shows vertical indicator.
    func showVerticalIndicator(){showsVerticalScrollIndicator=true}
    /// Hides horizontal indicator.
    func hideHorizontalIndicator(){showsHorizontalScrollIndicator=false}
    /// Shows horizontal indicator.
    func showHorizontalIndicator(){showsHorizontalScrollIndicator=true}
    /// Enables paging.
    func enablePaging(){isPagingEnabled=true}
    /// Disables paging.
    func disablePaging(){isPagingEnabled=false}
    /// Stops scrolling.
    func stopScrolling(){setContentOffset(contentOffset,animated:false)}
    /// Sets scroll indicator inset.
    func setIndicatorInsets(_ insets:UIEdgeInsets){scrollIndicatorInsets=insets}
    /// Sets content inset.
    func setScrollContentInsets(_ insets:UIEdgeInsets){contentInset=insets}
}
