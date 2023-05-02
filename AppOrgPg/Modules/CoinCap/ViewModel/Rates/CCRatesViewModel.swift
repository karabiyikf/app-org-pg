protocol CCRatesViewModel: ViewModel {
    var getRatesUseCase: CCGetRatesUseCase { get }
    var rates: [CCRate] { get }

    func getRates() async
    func update(rates: [CCRate])
}
