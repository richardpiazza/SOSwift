import Foundation
import SOSwiftVocabulary

// MARK: - CountryOrText

public extension KeyedEncodingContainer {
    public mutating func encodeCountryOrText(_ value: CountryOrText, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOCountry {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeCountryOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> CountryOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            let data = try JSONEncoder().encode(value)
            
            if value["@type"] as? String == SOCountry.type {
                // TODO: CountryOrTextConformance!
                let _ = try JSONDecoder().decode(SOCountry.self, from: data)
                return nil
            }
        } catch {
            print(error)
        }
        
        do {
            let value = try self.decodeIfPresent(String.self, forKey: key)
            return value
        } catch {
            print(error)
        }
        
        return nil
    }
}
