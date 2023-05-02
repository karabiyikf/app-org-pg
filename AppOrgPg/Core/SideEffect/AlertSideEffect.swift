struct AlertSideEffect: SideEffect {
    let title: String
    let message: String

    var onClickSecondary: () -> Void
    var onClickPrimary: () -> Void
}
