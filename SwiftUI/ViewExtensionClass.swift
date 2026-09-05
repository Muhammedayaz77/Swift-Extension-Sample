import SwiftUI

extension View {
    /// Applies a simple card appearance to the view.
    func cardStyle(cornerRadius: CGFloat = 12) -> some View {
        padding()
            .background(Color.gray.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

    /// Hides the view while keeping its layout space.
    @ViewBuilder
    func hidden(_ hidden: Bool) -> some View {
        if hidden {
            opacity(0)
        } else {
            self
        }
    }
}