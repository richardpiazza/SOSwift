import Foundation
import SOSwiftVocabulary

// MARK: - LanguageOrText

public extension KeyedEncodingContainer {
    public mutating func encodeLanguageOrText(_ value: LanguageOrText, forKey key: K) throws {
        if let typedValue = value as? SOLanguage {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeLanguageOrTextIfPresent(forKey key: K) throws -> LanguageOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOLanguage.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOLanguage.self, from: data)
            }
        } catch {
            print(error)
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
}
