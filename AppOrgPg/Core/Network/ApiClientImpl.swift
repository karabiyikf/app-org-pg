import Foundation

struct ApiClientImpl: ApiClient {
    func request<ResponseModel: Decodable>(
        _ request: NetworkRequest,
        for responseType: ResponseModel.Type
    ) async -> Result<ResponseModel, FKError> {
        let urlComponents = prepareUrlComponents(for: request)

        guard let url = urlComponents.url else {
            return .failure(.urlNotValid(urlComponents))
        }

        let urlRequest = prepareUrlRequest(url: url, request: request)

        return await makeRequest(urlRequest, with: request, for: responseType)
    }

    func request<RequestBody: Encodable, ResponseModel: Decodable>(
        _ request: NetworkRequest,
        body: RequestBody,
        for responseType: ResponseModel.Type
    ) async -> Result<ResponseModel, FKError> {
        let urlComponents = prepareUrlComponents(for: request)

        guard let url = urlComponents.url else {
            return .failure(.urlNotValid(urlComponents))
        }

        let urlRequest = prepareUrlRequest(url: url, request: request, body: body)

        return await makeRequest(urlRequest, with: request, for: responseType)
    }
}

fileprivate extension ApiClientImpl {
    func prepareUrlComponents(for request: NetworkRequest) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = request.baseUrl
        urlComponents.path = "/\(request.basePath)/\(request.path)"

        if let parameters = request.parameters {
            urlComponents.queryItems = parameters.map { .init(name: $0, value: $1) }
        }

        return urlComponents
    }

    func prepareUrlRequest(url: URL, request: NetworkRequest) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.method.name
        return urlRequest
    }

    func prepareUrlRequest<RequestBody: Encodable>(
        url: URL, request: NetworkRequest, body: RequestBody?
    ) -> URLRequest {
        var urlRequest = prepareUrlRequest(url: url, request: request)

        if let body {
            urlRequest.httpBody = try? request.encoder.encode(body)
        }

        return urlRequest
    }

    func makeRequest<ResponseModel: Decodable>(
        _ urlRequest: URLRequest,
        with request: NetworkRequest,
        for responseType: ResponseModel.Type
    ) async -> Result<ResponseModel, FKError> {
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let responseModel = try request.decoder.decode(ResponseModel.self, from: data)
            return .success(responseModel)
        } catch {
            return .failure(.unknown(error.localizedDescription))
        }
    }
}
