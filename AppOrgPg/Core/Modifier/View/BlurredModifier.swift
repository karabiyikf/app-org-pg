import SwiftUI

fileprivate struct BlurredModifier: ViewModifier {
    var when: Bool

    func body(content: Content) -> some View {
        content
            .allowsHitTesting(!when)
            .blur(radius: when ? 1 : 0)
    }
}

extension View {
    func blurred(when: Bool) -> some View {
        modifier(BlurredModifier(when: when))
    }
}
