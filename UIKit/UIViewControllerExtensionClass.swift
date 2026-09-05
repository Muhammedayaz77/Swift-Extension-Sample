import UIKit

extension UIViewController {
    /// Presents a view controller full screen.
    func presentFullScreen(_ controller:UIViewController,animated:Bool=true){controller.modalPresentationStyle=.fullScreen;present(controller,animated:animated)}
    /// Dismisses the current view controller.
    func dismissController(animated:Bool=true){dismiss(animated:animated)}
    /// Pops the current navigation controller screen.
    func popController(animated:Bool=true){navigationController?.popViewController(animated:animated)}
    /// Pops to the root view controller.
    func popToRootController(animated:Bool=true){navigationController?.popToRootViewController(animated:animated)}
    /// Returns the top-most presented controller.
    func getTopPresentedController()->UIViewController{var c:UIViewController=self;while let p=c.presentedViewController{c=p};return c}
    /// Returns the navigation controller.
    func getNavigationController()->UINavigationController?{navigationController}
    /// Hides the navigation bar.
    func hideNavigationBar(animated:Bool=true){navigationController?.setNavigationBarHidden(true,animated:animated)}
    /// Shows the navigation bar.
    func showNavigationBar(animated:Bool=true){navigationController?.setNavigationBarHidden(false,animated:animated)}
    /// Hides the tab bar when moving from this controller.
    func hideTabBar(){hidesBottomBarWhenPushed=true}
    /// Adds a child view controller.
    func addChildController(_ child:UIViewController,to container:UIView){addChild(child);container.addSubview(child.view);child.view.frame=container.bounds;child.view.autoresizingMask=[.flexibleWidth,.flexibleHeight];child.didMove(toParent:self)}
    /// Removes a child view controller.
    func removeChildController(_ child:UIViewController){child.willMove(toParent:nil);child.view.removeFromSuperview();child.removeFromParent()}
    /// Adds a tap gesture to dismiss the keyboard.
    func addKeyboardDismissGesture(){view.addGestureRecognizer(UITapGestureRecognizer(target:self,action:#selector(UIViewController.dismissKeyboardFromTap)))}
    /// Dismisses the keyboard from the view hierarchy.
    @objc private func dismissKeyboardFromTap(){view.endEditing(true)}
    /// Returns safe-area top inset.
    func getTopSafeArea()->CGFloat{view.safeAreaInsets.top}
    /// Returns safe-area bottom inset.
    func getBottomSafeArea()->CGFloat{view.safeAreaInsets.bottom}
    /// Returns screen width.
    func getScreenWidth()->CGFloat{UIScreen.main.bounds.width}
    /// Returns screen height.
    func getScreenHeight()->CGFloat{UIScreen.main.bounds.height}
    /// Adds a child controller and pins its view to the parent.
    func embed(_ child:UIViewController){addChild(child);view.addSubview(child.view);child.view.translatesAutoresizingMaskIntoConstraints=false;NSLayoutConstraint.activate([child.view.leadingAnchor.constraint(equalTo:view.leadingAnchor),child.view.trailingAnchor.constraint(equalTo:view.trailingAnchor),child.view.topAnchor.constraint(equalTo:view.topAnchor),child.view.bottomAnchor.constraint(equalTo:view.bottomAnchor)]);child.didMove(toParent:self)}
    /// Sets the navigation title.
    func setNavigationTitle(_ title:String){navigationItem.title=title}
    /// Removes navigation title.
    func clearNavigationTitle(){navigationItem.title=nil}
    /// Ends editing in the complete view hierarchy.
    func hideKeyboard(){view.endEditing(true)}
    /// Returns whether this controller is currently presented.
    func isPresentedController()->Bool{presentingViewController != nil}
    /// Returns whether navigation controller can pop.
    func canPopController()->Bool{navigationController?.viewControllers.count ?? 0 > 1}
}
