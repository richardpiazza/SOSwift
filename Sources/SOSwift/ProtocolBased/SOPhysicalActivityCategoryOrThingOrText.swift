import Foundation
import SOSwiftVocabulary

public enum SOPhysicalActivityCategoryOrThingOrText: PhysicalActivityCategoryOrThingOrText, Codable {
    case physicalActivityCategory(value: PhysicalActivityCategory)
    case thing(value: SOThing)
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
            
            if let physicalActivityCategory = PhysicalActivityCategory(rawValue: value) {
                self = .physicalActivityCategory(value: physicalActivityCategory)
            } else {
                self = .text(value: value)
            }
            return
        }
        
        guard let type = jsonDictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOThing.type:
            let value = try container.decode(SOThing.self)
            self = .thing(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .physicalActivityCategory(let value):
            try container.encode(value.rawValue)
        case .thing(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
    
    public var physicalActivityCategory: PhysicalActivityCategory? {
        switch self {
        case .physicalActivityCategory(let value):
            return value
        default:
            return nil
        }
    }
    
    public var thing: SOThing? {
        switch self {
        case .thing(let value):
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
    mutating func encodeIfPresent(_ value: PhysicalActivityCategoryOrThingOrText?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? SOPhysicalActivityCategoryOrThingOrText {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? PhysicalActivityCategory {
            try self.encode(typedValue.rawValue, forKey: key)
        } else if let typedValue = value as? SOThing {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [PhysicalActivityCategoryOrThingOrText]?, forKey key: K) throws {
        guard let value = value else {
            return
        }
        
        if let typedValue = value as? [SOPhysicalActivityCategoryOrThingOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value.forEach({ (object) in
            if let typedValue = object as? PhysicalActivityCategory {
                try container.encode(typedValue.rawValue)
            } else if let typedValue = object as? SOThing {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}

// MARK: - Decoding

public extension KeyedDecodingContainer {
    func decodePhysicalActivityCategoryOrThingOrTextIfPresent(forKey key: K) throws -> PhysicalActivityCategoryOrThingOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOPhysicalActivityCategoryOrThingOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodePhysicalActivityCategoriesOrThingsOrTextsIfPresent(forKey key: K) throws -> [PhysicalActivityCategoryOrThingOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOPhysicalActivityCategoryOrThingOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}
