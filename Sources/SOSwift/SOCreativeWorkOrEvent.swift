import Foundation
import SOSwiftVocabulary

public enum SOCreativeWorkOrEvent: CreativeWorkOrEvent, Codable {
    case creativeWork(value: SOCreativeWork)
    case event(value: SOEvent)
    
    public init(from decoder: Decoder) throws {
        let jsonContainer = try decoder.container(keyedBy: JSONCodingKeys.self)
        let dictionary = try jsonContainer.decode(Dictionary<String, Any>.self)
        
        guard let type = dictionary[SOThing.Keywords.type] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let container = try decoder.singleValueContainer()
        
        switch type {
        case SOCreativeWork.type:
            let value = try container.decode(SOCreativeWork.self)
            self = .creativeWork(value: value)
        case SOEvent.type:
            let value = try container.decode(SOEvent.self)
            self = .event(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .creativeWork(let value):
            try container.encode(value)
        case .event(let value):
            try container.encode(value)
        }
    }
    
    public var creativeWork: CreativeWork? {
        switch self {
        case .creativeWork(let value):
            return value
        default:
            return nil
        }
    }
    
    public var event: Event? {
        switch self {
        case .event(let value):
            return value
        default:
            return nil
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeCreativeWorkOrEventIfPresent(forKey key: K) throws -> CreativeWorkOrEvent? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOCreativeWorkOrEvent.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeCreativeWorksOrEventsIfPresent(forKey key: K) throws -> [CreativeWorkOrEvent]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOCreativeWorkOrEvent].self, forKey: key)
        } catch {
            return nil
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: CreativeWorkOrEvent?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? SOCreativeWorkOrEvent {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOCreativeWork {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOEvent {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [CreativeWorkOrEvent]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOCreativeWorkOrEvent] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOCreativeWork {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOEvent {
                try container.encode(typedValue)
            }
        })
    }
}

