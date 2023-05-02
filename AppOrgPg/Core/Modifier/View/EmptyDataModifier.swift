import SwiftUI

fileprivate struct EmptyDataModifier: ViewModifier {
    var when: Bool
    var text: String

    func body(content: Content) -> some View {
        if when {
            ZStack {
                content

                EmptyDataView(text: text)
            }
        } else {
            content
        }
    }
}

extension View {
    func emptyData(when: Bool, text: String = "No Data") -> some View {
        modifier(EmptyDataModifier(when: when, text: text))
    }
}
