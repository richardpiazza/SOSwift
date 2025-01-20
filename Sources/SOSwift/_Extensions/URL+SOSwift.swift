import Foundation

public extension URL {
    var isValid: Bool {
        guard let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return false
        }

        guard urlComponents.scheme != nil else {
            return false
        }

        switch urlComponents.scheme!.lowercased() {
        case "http", "https":
            return true
        default:
            return false
        }
    }
}
