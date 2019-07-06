import Foundation

public protocol Schema {
    static var schemaContext: String { get }
    static var schemaType: String { get }
}

public extension Schema {
    static var schemaContext: String {
        return "http://www.schema.org"
    }
    
    static var schemaType: String {
        return String(describing: self)
    }
}

public enum SchemaKeys: String, CodingKey {
    case id = "@id"
    case context = "@context"
    case type = "@type"
}

public enum SchemaError: Error {
    case typeDecodingError
    case incorrectDateFormat
}

public enum SchemaDecodingError: Error {
    case failedStringToData
}

public enum SchemaEncodingError: Error {
    case failedJsonObjectToDictionary
    case failedDataToString
}

public extension Schema where Self: Decodable {
    static func make(with json: String, jsonDecoder: JSONDecoder = JSONDecoder()) throws -> Self {
        guard let data = json.data(using: .utf8) else {
            throw SchemaDecodingError.failedStringToData
        }
        
        return try make(with: data, jsonDecoder: jsonDecoder)
    }
    
    static func make(with dictionary: [String : Any], jsonDecoder: JSONDecoder = JSONDecoder()) throws -> Self {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: .init())
        return try make(with: data, jsonDecoder: jsonDecoder)
    }
    
    static func make(with data: Data, jsonDecoder: JSONDecoder = JSONDecoder()) throws -> Self {
        return try jsonDecoder.decode(Self.self, from: data)
    }
}

public extension Schema where Self: Encodable {
    func asData(jsonEncoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try jsonEncoder.encode(self)
    }
    
    func asDictionary(jsonEncoder: JSONEncoder = JSONEncoder()) throws -> [String : Any] {
        let data = try asData(jsonEncoder: jsonEncoder)
        let object = try JSONSerialization.jsonObject(with: data, options: .init())
        
        guard let dictionary = object as? [String : Any] else {
            throw SchemaEncodingError.failedJsonObjectToDictionary
        }
        
        return dictionary
    }
    
    func asJSON(jsonEncoder: JSONEncoder = JSONEncoder()) throws -> String {
        let dictionary = try asDictionary(jsonEncoder: jsonEncoder)
        
        var options: JSONSerialization.WritingOptions = .init()
        if #available(OSX 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *) {
            options.insert(.sortedKeys)
        }
        
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: options)
        
        guard let json = String(data: data, encoding: .utf8) else {
            throw SchemaEncodingError.failedDataToString
        }
        
        return json
    }
    
    func asPrettyJSON(jsonEncoder: JSONEncoder = JSONEncoder()) throws -> String {
        let dictionary = try asDictionary(jsonEncoder: jsonEncoder)
        
        var options: JSONSerialization.WritingOptions = .init()
        options.insert(.prettyPrinted)
        if #available(OSX 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *) {
            options.insert(.sortedKeys)
        }
        
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: options)
        
        guard let json = String(data: data, encoding: .utf8) else {
            throw SchemaEncodingError.failedDataToString
        }
        
        return json
    }
}
