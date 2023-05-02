protocol CCGetRatesDataSource {
    func getRates() async -> Result<[CCRate], FKError>
}
