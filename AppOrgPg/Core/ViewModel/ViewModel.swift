import Foundation

protocol ViewModel: ObservableObject {
    var isLoading: Bool { get }
    var sideEffect: SideEffect? { get }

    func update(isLoading: Bool)
    func publish(sideEffect: SideEffect)
}
