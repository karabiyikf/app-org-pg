import SwiftUI

struct AlertSideEffectView: View {
    var effect: AlertSideEffect

    var body: some View {
        VStack(spacing: 8) {
            Text(effect.title)
                .font(.title3)
                .fontWeight(.bold)

            Text(effect.message)
                .font(.subheadline)

            HStack(spacing: 4) {
                Button(
                    action: effect.onClickSecondary,
                    label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(4)
                    }
                )
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)

                Button(
                    action: effect.onClickPrimary,
                    label: {
                        Text("OK")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(4)
                    }
                )
                .buttonStyle(.plain)
            }
        }
        .padding()
        .background(Color(red: 0.94, green: 0.94, blue: 0.94))
        .cornerRadius(10)
        .padding(.horizontal, 50)
    }
}
