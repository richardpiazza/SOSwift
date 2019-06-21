import Foundation
import SOSwiftVocabulary

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: SOSwiftVocabulary.Number?, forKey key: K) throws {
        if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Double {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension SingleValueEncodingContainer {
    mutating func encode(_ value: SOSwiftVocabulary.Number) throws {
        if let typedValue = value as? Int {
            try self.encode(typedValue)
        } else if let typedValue = value as? Double {
            try self.encode(typedValue)
        }
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodeNumberIfPresent(forKey key: K) throws -> SOSwiftVocabulary.Number? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode(Int.self, forKey: key)
            return value
        } catch {
        }
        
        do {
            let value = try self.decode(Double.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `Number` for key: \(key.stringValue).")
        
        return nil
    }
}

public extension SingleValueDecodingContainer {
    func decodeNumber() throws -> SOSwiftVocabulary.Number {
        do {
            let value = try self.decode(Int.self)
            return value
        } catch {
        }
        
        return try self.decode(Double.self)
    }
}
