import Foundation

public enum DynamicError: Error {
    case typeNotFound(type: String)
    case invalidTypeKey
    case notEncodable
}

public protocol Dynamic: Encodable, Decodable {
    static var type: String { get }
    static var dynamicSubtypes: [Dynamic.Type] { get }
}

public extension Dynamic {
    internal static var TypeKey: String {
        return "type"
    }
    
    static func getDynamicType(with type: String) throws -> Dynamic.Type {
        if self.type == type {
            return self
        }
        
        for subtype in dynamicSubtypes {
            do {
                let dynamicType = try subtype.getDynamicType(with: type)
                return dynamicType
            } catch {
                
            }
        }
        
        throw DynamicError.typeNotFound(type: type)
    }
    
    static func makeDynamic(with dictionary: Dictionary<String, Any>) throws -> Dynamic {
        guard dictionary.keys.contains(self.TypeKey) else {
            throw DynamicError.invalidTypeKey
        }
        
        guard let dynamicTypeKey = dictionary[self.TypeKey] as? String else {
            throw DynamicError.invalidTypeKey
        }
        
        let dynamicType = try self.getDynamicType(with: dynamicTypeKey)
        
        return try dynamicType.make(with: dictionary)
    }
    
    internal static func make(with dictionary: Dictionary<String, Any> = Dictionary<String, Any>()) throws -> Self {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions())
        return try JSONDecoder().decode(self, from: data)
    }
    
    static func encodeDynamic(_ dynamic: Dynamic, to container: UnkeyedEncodingContainer) throws {
        guard let dynamicSelf = dynamic as? Self else {
            throw DynamicError.notEncodable
        }
        
        var container = container
        try container.encode(dynamicSelf)
    }
}
