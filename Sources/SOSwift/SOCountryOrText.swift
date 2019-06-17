import Foundation
import SOSwiftVocabulary

public enum SOCountryOrText: CountryOrText, Codable {
    case country(value: SOCountry)
    case text(value: String)
    
    public init(from decoder: Decoder) throws {
        var dictionary: [String : Any]?
        
        do {
            let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
            dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        } catch {
            
        }
        
        guard let jsonDictionary = dictionary else {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            self = .text(value: value)
            return
        }
        
        guard let type = jsonDictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOCountry.type:
            let value = try container.decode(SOCountry.self)
            self = .country(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .country(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var country: Country? {
        switch self {
        case .country(let value):
            return value
        default:
            return nil
        }
    }
    
    public var text: String? {
        switch self {
        case .text(let value):
            return value
        default:
            return nil
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeCountryOrTextIfPresent(forKey key: K) throws -> CountryOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOCountryOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeCountriesOrTextsIfPresent(forKey key: K) throws -> [CountryOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOCountryOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: CountryOrText?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOCountryOrText {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOCountry {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [CountryOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOCountryOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOCountry {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}