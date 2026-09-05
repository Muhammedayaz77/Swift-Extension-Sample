import SwiftUI

extension Binding where Value == Bool {
    /// Creates a binding that toggles the wrapped Boolean value.
    var toggled: Binding<Bool> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
}