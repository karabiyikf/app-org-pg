import Foundation

struct Logger {
    var tag = #file

    func log(
        tag: String? = nil,
        function: String = #function,
        message: Any? = nil
    ) {
        if loggerDisabled { return }

        let _tag = tag ?? (self.tag as NSString)
            .lastPathComponent
            .replacingOccurrences(of: ".swift", with: "")

        if let message {
            debugPrint("\(_tag)::\(function), \(message)")
        } else {
            debugPrint("\(_tag)::\(function)")
        }
    }
}

#if DEBUG
fileprivate var loggerDisabled = false
#else
fileprivate var loggerDisabled = true
#endif
