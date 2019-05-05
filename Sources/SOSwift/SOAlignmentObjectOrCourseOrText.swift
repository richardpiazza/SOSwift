import Foundation
import SOSwiftVocabulary

public enum SOAlignmentObjectOrCourseOrText: AlignmentObjectOrCourseOrText, Codable {
    case alignmentObject(value: SOAlignmentObject)
    case course(value: SOCourse)
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
        case SOAlignmentObject.type:
            let value = try container.decode(SOAlignmentObject.self)
            self = .alignmentObject(value: value)
        case SOCourse.type:
            let value = try container.decode(SOCourse.self)
            self = .course(value: value)
        default:
            throw DynamicError.invalidTypeKey
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .alignmentObject(let value):
            try container.encode(value)
        case .course(let value):
            try container.encode(value)
        case .text(let value):
            try container.encode(value)
        }
    }
}

public extension KeyedDecodingContainer {
    func decodeAlignmentObjectOrCourseOrTextIfPresent(forKey key: K) throws -> AlignmentObjectOrCourseOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent(SOAlignmentObjectOrCourseOrText.self, forKey: key)
        } catch {
            return nil
        }
    }
    
    func decodeAlignmentObjectsOrCoursesOrTextsIfPresent(forKey key: K) throws -> [AlignmentObjectOrCourseOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            return try self.decodeIfPresent([SOAlignmentObjectOrCourseOrText].self, forKey: key)
        } catch {
            return nil
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encodeIfPresent(_ value: AlignmentObjectOrCourseOrText?, forKey key: K) throws {
        if let typedValue = value as? SOAlignmentObjectOrCourseOrText {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOAlignmentObject {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOCourse {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    mutating func encodeIfPresent(_ value: [AlignmentObjectOrCourseOrText]?, forKey key: K) throws {
        guard value != nil else {
            return
        }
        
        if let typedValue = value as? [SOAlignmentObjectOrCourseOrText] {
            try self.encode(typedValue, forKey: key)
            return
        }
        
        var container = nestedUnkeyedContainer(forKey: key)
        
        try value?.forEach({ (object) in
            if let typedValue = object as? SOAlignmentObject {
                try container.encode(typedValue)
            } else if let typedValue = object as? SOCourse {
                try container.encode(typedValue)
            } else if let typedValue = object as? String {
                try container.encode(typedValue)
            }
        })
    }
}
