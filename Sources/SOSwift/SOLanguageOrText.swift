import Foundation
import SOSwiftVocabulary

// MARK: - LanguageOrText

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: LanguageOrText?, forKey key: K) throws {
        if let typedValue = value as? SOLanguage {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeLanguageOrTextIfPresent(forKey key: K) throws -> LanguageOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOLanguage.type {
                return try self.decode(SOLanguage.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `LanguageOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
