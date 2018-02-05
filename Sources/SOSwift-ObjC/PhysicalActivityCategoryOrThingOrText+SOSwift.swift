import Foundation
import SOSwiftVocabulary_ObjC

// MARK: - PhysicalActivityCategoryOrThingOrText

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: PhysicalActivityCategoryOrThingOrText?, forKey key: K) throws {
        if let typedValue = value as? SOThing {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? Int {
            try self.encode(typedValue, forKey: key)
        } else if let typedValue = value as? String {
            try self.encode(typedValue, forKey: key)
        }
    }
}

public extension KeyedDecodingContainer {
    public func decodePhysicalActivityCategoryOrThingOrTextIfPresent(forKey key: K) throws -> PhysicalActivityCategoryOrThingOrText? {
        guard self.contains(key) else {
            return nil
        }
        
        do {
            let dictionary = try self.decode(Dictionary<String, Any>.self, forKey: key)
            if dictionary[SOThing.Keywords.type] as? String == SOThing.type {
                return try self.decode(SOThing.self, forKey: key)
            }
        } catch {
        }
        
        do {
            let value = try self.decode(String.self, forKey: key)
            
            if let enumValue = PhysicalActivityCategory(stringValue: value) {
                return enumValue.rawValue as NSNumber
            }
            
            return value as NSString
        } catch {
        }
        
        print("Failed to decode `PhysicalActivityCategoryOrThingOrText` for key: \(key.stringValue).")
        
        return nil
    }
}