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

// MARK: - URL

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: URL?, forKey key: K) throws {
        if let typedValue = value {
            try self.encode(typedValue, forKey: key)
        }
    }
}
