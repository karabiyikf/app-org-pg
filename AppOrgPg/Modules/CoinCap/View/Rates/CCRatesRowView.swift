import SwiftUI

struct CCRatesRowView: View {
    var rate: CCRate

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 4) {
                Text(rate.name)
                    .shrink()

                Spacer()

                Text(rate.symbol)
            }
            .font(.title3)

            Text("\(rate.rateUsd) $")
                .font(.subheadline)
        }
    }
}
