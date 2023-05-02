struct CCRate: Decodable, Identifiable {
    let id: String
    let symbol: String
    let currencySymbol: String?
    let type: String
    let rateUsd: String

    var name: String {
        id.replacingOccurrences(of: "-", with: " ").capitalized
    }
}
