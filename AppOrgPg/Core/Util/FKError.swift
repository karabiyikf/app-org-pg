import Foundation

enum FKError: Error {
    case urlNotValid(URLComponents) // Error Code: 601
    case unknown(String)

    var message: String {
        switch self {
            case .urlNotValid(_):
                return "Something went wrong! Please, try again some time later (601)"
            case .unknown(let string):
                return string
        }
    }
}
