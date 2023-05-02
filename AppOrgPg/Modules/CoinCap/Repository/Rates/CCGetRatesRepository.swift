protocol CCGetRatesRepository {
    var dataSource: CCGetRatesDataSource { get }
    
    func getRates() async -> Result<[CCRate], FKError>
}
