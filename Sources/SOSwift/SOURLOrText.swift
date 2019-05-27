import Foundation
import SOSwiftVocabulary

// MARK: - URLOrText

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: URLOrText?, forKey key: K) throws {
        if let typedValue = value as? URL {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeURLOrTextIfPresent(forKey key: K) throws -> URLOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(URL.self, forKey: key)
            if value.isValid {
                return value
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `TextOrURL` for key: \(key.stringValue).")
        
        return nil
    }
}
