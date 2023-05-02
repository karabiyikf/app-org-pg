import SwiftUI

final class CCRatesViewModelImpl: CCRatesViewModel {
    var getRatesUseCase: CCGetRatesUseCase

    init(getRatesUseCase: CCGetRatesUseCase = .init()) {
        self.getRatesUseCase = getRatesUseCase
    }

    @Published
    var rates: [CCRate] = []
    @Published
    var isLoading: Bool = false
    @Published
    var sideEffect: SideEffect? = nil

    @MainActor
    func update(rates: [CCRate]) { self.rates = rates }
    @MainActor
    func update(isLoading: Bool) { self.isLoading = isLoading }
    @MainActor
    func publish(sideEffect: SideEffect) { self.sideEffect = sideEffect }

    func getRates() async {
        await update(isLoading: true)

        let result = await getRatesUseCase.execute(input: Void())
        switch result {
            case .success(let rates):
                await update(rates: rates)
            case .failure(let error):
                await handleFailure(error)
        }

        await update(isLoading: false)
    }

    private func handleFailure(_ error: FKError) async {
        let effect = AlertSideEffect(
            title: "Rates",
            message: error.message,
            onClickSecondary: { [weak self] in
                self?.sideEffect = nil
            },
            onClickPrimary: { [weak self] in
                self?.sideEffect = nil
            }
        )

        await publish(sideEffect: effect)
    }
}
