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
    
    public mutating func encodeAlignmentObjectsOrCoursesOrTexts(_ values: [AlignmentObjectOrCourseOrText], forKey key: KeyedEncodingContainer.Key) throws {
        var encodables = [Encodable]()
        
        for value in values {
            if let typedValue = value as? SOAlignmentObject {
                encodables.append(typedValue)
            } else if let typedValue = value as? SOCourse {
                encodables.append(typedValue)
            } else if let typedValue = value as? String {
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
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOAlignmentObject.type {
                return try self.decode(SOAlignmentObject.self, forKey: key)
            } else if dictionary[SOThing.Keywords.type] as? String == SOCourse.type {
                return try self.decode(SOCourse.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            return value
        } catch {
        }
        
        print("Failed to decode `AlignmentObjectOrCourseOrText` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodeAlignmentObjectsOrCoursesOrTextsIfPresent(forKey key: KeyedDecodingContainer.Key) throws -> [AlignmentObjectOrCourseOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        var elements = [AlignmentObjectOrCourseOrText]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    if dictionary[SOThing.Keywords.type] as? String == SOAlignmentObject.type {
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                        let object = try JSONDecoder().decode(SOAlignmentObject.self, from: data)
                        elements.append(object)
                    } else if dictionary[SOThing.Keywords.type] as? String == SOCourse.type {
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                        let object =  try JSONDecoder().decode(SOCourse.self, from: data)
                        elements.append(object)
                    }
                } else if let value = element as? String {
                    elements.append(value)
                }
            }
            
            return elements
        } catch {
        }
        
        print("Failed to decode `[AlignmentObjectOrCourseOrText]` for key: \(key.stringValue).")
        
        return nil
    }
}
