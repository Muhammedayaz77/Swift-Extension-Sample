import SwiftUI

extension Color {
    /// Creates a color from a hexadecimal value.
    init(hex: UInt, opacity: Double = 1.0) {
        let red = Double((hex >> 16) & 0xFF) / 255
        let green = Double((hex >> 8) & 0xFF) / 255
        let blue = Double(hex & 0xFF) / 255

        self.init(
            red: red,
            green: green,
            blue: blue,
            opacity: opacity
        )
    }
}