import Foundation
import SOSwiftVocabulary

public enum SOPlaceOrPostalAddressOrText: PlaceOrPostalAddressOrText, Codable {
    case place(value: SOPlace)
    case postalAddress(value: SOPostalAddress)
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
        case SOPlace.type:
            let value = try container.decode(SOPlace.self)
            self = .place(value: value)
        case SOPostalAddress.type:
            let value = try container.decode(SOPostalAddress.self)
            self = .postalAddress(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .place(let value):
            try container.encode(value)
        case .postalAddress(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var place: SOPlace? {
        switch self {
        case .place(let value):
            return value
        default:
            return nil
        }
    }
    
    public var postalAddress: SOPostalAddress? {
        switch self {
        case .postalAddress(let value):
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

// MARK: - Encoding

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: PlaceOrPostalAddressOrText?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOPlaceOrPostalAddressOrText {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPlace {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOPostalAddress {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [PlaceOrPostalAddressOrText]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? [SOPlaceOrPostalAddressOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value.forEach({ (object) in
            if let typedValue = object as? SOPlace {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOPostalAddress {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodePlaceOrPostalAddressOrTextIfPresent(forKey key: K) throws -> PlaceOrPostalAddressOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOPlaceOrPostalAddressOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodePlacesOrPostalAddressesOrTextsIfPresent(forKey key: K) throws -> [PlaceOrPostalAddressOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOPlaceOrPostalAddressOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
