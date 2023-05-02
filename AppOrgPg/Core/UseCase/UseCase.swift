protocol UseCase<Input, Output> {
    associatedtype Input
    associatedtype Output

    func execute(input: Input) async -> Result<Output, FKError>
}
