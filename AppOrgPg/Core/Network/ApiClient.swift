protocol ApiClient {
    func request<ResponseModel: Decodable>(
        _ request: NetworkRequest,
        for responseType: ResponseModel.Type
    ) async -> Result<ResponseModel, FKError>

    func request<RequestBody: Encodable, ResponseModel: Decodable>(
        _ request: NetworkRequest,
        body: RequestBody,
        for responseType: ResponseModel.Type
    ) async -> Result<ResponseModel, FKError>
}
