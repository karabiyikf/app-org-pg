struct CCGetRatesUseCase: UseCase {
    var repository: CCGetRatesRepository = CCGetRatesRepositoryImpl()

    typealias Input = Void
    typealias Output = [CCRate]

    func execute(input: Void) async -> Result<[CCRate], FKError> {
        return await repository.getRates()
    }
}
