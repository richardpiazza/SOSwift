import Foundation

public extension URL {
    var isValid: Bool {
        guard let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return false
        }
        
        return urlComponents.scheme != nil
    }
}
