import SwiftUI

struct CCRatesView<VM: CCRatesViewModel>: View {
    @StateObject
    var viewModel: VM

    init(viewModel: VM = CCRatesViewModelImpl()) {
        _viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        ContainerView(
            isLoading: viewModel.isLoading,
            sideEffect: viewModel.sideEffect
        ) {
            list
        }
        .task { await viewModel.getRates() }
    }

    @ViewBuilder
    var list: some View {
        List {
            ForEach(viewModel.rates) { rate in
                CCRatesRowView(rate: rate)
            }
        }
        .refreshable { await viewModel.getRates() }
        .emptyData(when: isEmptyData)
    }

    var isEmptyData: Bool {
        !viewModel.isLoading && viewModel.rates.isEmpty
    }
}
