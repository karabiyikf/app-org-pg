import SwiftUI

fileprivate struct ShrinkSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
}

extension View {
    func shrink() -> some View {
        modifier(ShrinkSizeModifier())
    }
}
