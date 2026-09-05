//
//  ExtentionsClass.swift
//  Swift-Extension-Sample
//
//  Hind Tech Group (HTG)
//
//  Legacy compatibility file.
//  Extensions are now organized into dedicated files by Foundation/UIKit type.
//

import UIKit

/// Legacy namespace retained for projects that referenced the original sample file.
/// New extensions should be added to the corresponding *ExtensionClass.swift file.
class ExtentionsClass: NSObject {
    /// Returns the main screen width.
    var screenWidth: CGFloat { UIScreen.main.bounds.width }
    /// Returns the main screen height.
    var screenHeight: CGFloat { UIScreen.main.bounds.height }
}
