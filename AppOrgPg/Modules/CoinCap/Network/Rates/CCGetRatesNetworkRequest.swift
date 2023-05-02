struct CCGetRatesNetworkRequest: CCNetworkRequest {
    var method: HttpMethod = .get

    var path: String = "rates"

    var parameters: [String : String]? = nil
}
