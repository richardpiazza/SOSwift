import Foundation
import SOSwiftVocabulary

// MARK: - AlignmentObjectOrCourseOrText

public extension KeyedEncodingContainer {
    public mutating func encodeAlignmentObjectOrCourseOrText(_ value: AlignmentObjectOrCourseOrText, forKey key: KeyedEncodingContainer.Key) throws {
        if let typedValue = value as? SOAlignmentObject {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOCourse {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeAlignmentObjectsOrCoursesOrTexts(_ value: [AlignmentObjectOrCourseOrText], forKey key: KeyedEncodingContainer.Key) throws {
        var encodables = [Encodable]()
        
        for element in value {
            if let typedValue = element as? SOAlignmentObject {
                encodables.append(typedValue)
            } else if let typedValue = element as? SOCourse {
                encodables.append(typedValue)
            } else if let typedValue = element as? String {
                encodables.append(typedValue)
            }
        }
        
        try self.encode(encodables, forKey: key)
    }
}

public extension KeyedDecodingContainer {
    public func decodeAlignmentObjectOrCourseOrTextIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> AlignmentObjectOrCourseOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let value = try self.decode([String : AnyObject].self, forKey: key)
            if value["@type"] as? String == SOAlignmentObject.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOAlignmentObject.self, from: data)
            } else if value["@type"] as? String == SOCourse.type {
                let data = try JSONEncoder().encode(value)
                return try JSONDecoder().decode(SOCourse.self, from: data)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        return nil
    }
    
    public func decodeAlignmentObjectsOrCoursesOrTextsIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> [AlignmentObjectOrCourseOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        var elements = [AlignmentObjectOrCourseOrText]()
        
        do {
            let value = try self.decode([[String : AnyObject]].self, forKey: key)
            for element in value {
                if element["@type"] as? String == SOAlignmentObject.type {
                    let data = try JSONEncoder().encode(element)
                    let object = try JSONDecoder().decode(SOAlignmentObject.self, from: data)
                    elements.append(object)
                } else if element["@type"] as? String == SOCourse.type {
                    let data = try JSONEncoder().encode(element)
                    let object =  try JSONDecoder().decode(SOCourse.self, from: data)
                    elements.append(object)
                }
            }
        } catch {
        }
        
        do {
            let value = try self.decode([String].self, forKey: key)
            for element in value {
                elements.append(element)
            }
        } catch {
        }
        
        return elements
    }
}
