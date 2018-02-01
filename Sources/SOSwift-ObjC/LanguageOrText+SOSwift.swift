import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - LanguageOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: LanguageOrText?, forKey key: K) throws {
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
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOLanguage.type {
                return try self.decode(SOLanguage.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value as NSString
        } catch {
        }
        
        print("Failed to decode `LanguageOrText` for key: \(key.stringValue).")
        
        return nil
    }
}
