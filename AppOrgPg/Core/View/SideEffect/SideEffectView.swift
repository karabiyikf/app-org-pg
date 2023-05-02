import SwiftUI

struct SideEffectView: View {
    var sideEffect: SideEffect?

    var body: some View {
        if let effect = sideEffect as? AlertSideEffect {
            AlertSideEffectView(effect: effect)
        } else if let effect = sideEffect as? ToastSideEffect {
            ToastSideEffectView(effect: effect)
        }
    }
}
