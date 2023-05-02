import SwiftUI

struct ContainerView<Content: View>: View {
    var isLoading: Bool = false
    var sideEffect: SideEffect? = nil

    @ViewBuilder
    var content: () -> Content

    var body: some View {
        ZStack {
            ZStack(content: content)
                .blurred(when: isBlurred)

            SideEffectView(sideEffect: sideEffect)

            if isLoading {
                loading
            }
        }
    }

    @ViewBuilder
    var loading: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
    }

    var isBlurred: Bool {
        isLoading || sideEffect != nil
    }
}
