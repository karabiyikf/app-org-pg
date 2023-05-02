struct CCGetRatesRepositoryImpl: CCGetRatesRepository {
    var dataSource: CCGetRatesDataSource = CCGetRatesRemoteDataSourceImpl()

    func getRates() async -> Result<[CCRate], FKError> {
        return await dataSource.getRates()
    }
}
