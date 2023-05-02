import Foundation

protocol NetworkRequest {
    var method: HttpMethod { get }
    var baseUrl: String { get }
    var basePath: String { get }
    var path: String { get }
    var parameters: [String: String]? { get }
    var headers: [String: String]? { get }

    var encoder: JSONEncoder { get }
    var decoder: JSONDecoder { get }
}
