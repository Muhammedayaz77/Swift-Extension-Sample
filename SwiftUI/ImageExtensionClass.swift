import SwiftUI

extension Image {
    /// Returns a resizable image that maintains its aspect ratio.
    func aspectFit() -> some View {
        resizable()
            .scaledToFit()
    }

    /// Returns a resizable image that fills its available space.
    func aspectFill() -> some View {
        resizable()
            .scaledToFill()
    }
}