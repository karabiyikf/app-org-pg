import SwiftUI

struct ToastSideEffectView: View {
    var effect: ToastSideEffect

    var body: some View {
        VStack {
            Spacer()

            Text(effect.message)
                .lineLimit(5)
                .font(.subheadline)
                .padding()
                .background(Color(red: 0.94, green: 0.94, blue: 0.94))
                .cornerRadius(20)
                .padding(.horizontal, 50)
        }
    }
}
