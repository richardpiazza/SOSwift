import Foundation

public extension URL {
    var isValid: Bool {
        guard let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return false
        }
        
        return urlComponents.scheme != nil
    }
}

// MARK: - URL

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: URL?, forKey key: K) throws {
        if let typedValue = value {
            try self.encode(typedValue, forKey: key)
        }
    }
}
