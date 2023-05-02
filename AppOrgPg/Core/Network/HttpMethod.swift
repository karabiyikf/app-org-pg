enum HttpMethod {
    case get, post

    var name: String {
        switch self {
            case .get: return "GET"
            case .post: return "POST"
        }
    }
}
