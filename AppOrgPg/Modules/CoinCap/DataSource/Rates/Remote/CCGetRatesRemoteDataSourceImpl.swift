struct CCGetRatesRemoteDataSourceImpl: CCGetRatesRemoteDataSource {
    var apiClient: ApiClient = ApiClientImpl()

    func getRates() async -> Result<[CCRate], FKError> {
        let networkRequest = CCGetRatesNetworkRequest()
        let result = await apiClient.request(
            networkRequest, for: CCNetworkResponse<[CCRate]>.self
        )
        switch result {
            case .success(let response):
                return .success(response.data)
            case .failure(let error):
                return .failure(error)
        }
    }
}
