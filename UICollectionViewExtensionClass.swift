import UIKit

extension UICollectionView {
    /// Registers a reusable cell class.
    func registerCellClass<T:UICollectionViewCell>(_ type:T.Type){register(type,forCellWithReuseIdentifier:String(describing:type))}
    /// Dequeues a typed reusable cell.
    func dequeueCell<T:UICollectionViewCell>(_ type:T.Type,for indexPath:IndexPath)->T?{dequeueReusableCell(withReuseIdentifier:String(describing:type),for:indexPath) as? T}
    /// Reloads the collection view on the main queue.
    func reloadCollection(){DispatchQueue.main.async{self.reloadData()}}
    /// Returns section count.
    func getSectionCount()->Int{numberOfSections}
    /// Returns item count for a section.
    func getItemCount(section:Int)->Int{section<numberOfSections ? numberOfItems(inSection:section):0}
    /// Returns whether an index path exists.
    func hasItem(_ indexPath:IndexPath)->Bool{indexPath.section<numberOfSections && indexPath.item<numberOfItems(inSection:indexPath.section)}
    /// Scrolls to the top-left.
    func scrollCollectionToTop(animated:Bool=true){setContentOffset(CGPoint(x:-adjustedContentInset.left,y:-adjustedContentInset.top),animated:animated)}
    /// Scrolls to the bottom.
    func scrollCollectionToBottom(animated:Bool=true){let y=max(-adjustedContentInset.top,contentSize.height-bounds.height+adjustedContentInset.bottom);setContentOffset(CGPoint(x:contentOffset.x,y:y),animated:animated)}
    /// Deselects every selected item.
    func deselectAllItems(animated:Bool=true){indexPathsForSelectedItems?.forEach{deselectItem(at:$0,animated:animated)}}
    /// Selects an item safely.
    func selectItemSafely(_ indexPath:IndexPath,animated:Bool=true){if hasItem(indexPath){selectItem(at:indexPath,animated:animated,scrollPosition:[])}}
    /// Sets collection background color.
    func setCollectionBackgroundColor(_ color:UIColor){backgroundColor=color}
    /// Enables scrolling.
    func enableCollectionScrolling(){isScrollEnabled=true}
    /// Disables scrolling.
    func disableCollectionScrolling(){isScrollEnabled=false}
    /// Hides vertical indicator.
    func hideCollectionVerticalIndicator(){showsVerticalScrollIndicator=false}
    /// Hides horizontal indicator.
    func hideCollectionHorizontalIndicator(){showsHorizontalScrollIndicator=false}
    /// Enables paging.
    func enableCollectionPaging(){isPagingEnabled=true}
    /// Disables paging.
    func disableCollectionPaging(){isPagingEnabled=false}
    /// Returns content width.
    func getContentWidth()->CGFloat{contentSize.width}
    /// Returns content height.
    func getContentHeight()->CGFloat{contentSize.height}
    /// Removes all selected items.
    func clearSelection(){deselectAllItems(animated:false)}
}
