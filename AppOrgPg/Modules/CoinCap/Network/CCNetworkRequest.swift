import Foundation

protocol CCNetworkRequest: NetworkRequest { }

extension CCNetworkRequest {
    var baseUrl: String {
        "api.coincap.io"
    }

    var basePath: String {
        "v2"
    }

    var headers: [String : String]? {
        [
            "Accept-Encoding": "gzip"
        ]
    }

    var encoder: JSONEncoder {
        JSONEncoder()
    }

    var decoder: JSONDecoder {
        JSONDecoder()
    }
}
