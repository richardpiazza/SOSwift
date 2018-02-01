import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - AlignmentObjectOrCourseOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: AlignmentObjectOrCourseOrText?, forKey key: K) throws {
        if let typedValue = value as? SOAlignmentObject {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? SOCourse {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
    
    public mutating func encodeIfPresent(_ values: [AlignmentObjectOrCourseOrText]?, forKey key: K) throws {
        guard let values = values else {
            return
        }
        
        var subcontainer = self.nestedUnkeyedContainer(forKey: key)
        
        for value in values {
            if let typedValue = value as? SOAlignmentObject {
                try subcontainer.encode(typedValue)
            } else if let typedValue = value as? SOCourse {
                try subcontainer.encode(typedValue)
            } else if let typedValue = value as? String {
                try subcontainer.encode(typedValue)
            }
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodeAlignmentObjectOrCourseOrTextIfPresent(forKey key: K) throws -> AlignmentObjectOrCourseOrText? {
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
            let value = try self.decode(String.self, forKey: key) as NSString
            return value
        } catch {
        }
        
        print("Failed to decode `AlignmentObjectOrCourseOrText` for key: \(key.stringValue).")
        
        return nil
    }
    
    public func decodeAlignmentObjectsOrCoursesOrTextsIfPresent(forKey key: K) throws -> [AlignmentObjectOrCourseOrText]? {
        guard self.contains(key) else {
            return nil
        }
        
        var decodables = [AlignmentObjectOrCourseOrText]()
        
        do {
            let array = try self.decode([Any].self, forKey: key)
            for element in array {
                if let dictionary = element as? [String : Any] {
                    if dictionary[SOThing.Keywords.type] as? String == SOAlignmentObject.type {
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                        let decodable = try JSONDecoder().decode(SOAlignmentObject.self, from: data)
                        decodables.append(decodable)
                    } else if dictionary[SOThing.Keywords.type] as? String == SOCourse.type {
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
                        let decodable =  try JSONDecoder().decode(SOCourse.self, from: data)
                        decodables.append(decodable)
                    }
                } else if let value = element as? NSString {
                    decodables.append(value)
                }
            }
            
            return decodables
        } catch {
        }
        
        do {
            if let element = try self.decodeAlignmentObjectOrCourseOrTextIfPresent(forKey: key) {
                return [element]
            }
        } catch {
        }
        
        print("Failed to decode `[AlignmentObjectOrCourseOrText]` for key: \(key.stringValue).")
        
        return nil
    }
}
