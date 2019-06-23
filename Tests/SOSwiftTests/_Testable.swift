import Foundation
@testable import SOSwift

enum TestErrors: Error {
    case utf8Encoding
    case serialization
}

protocol Testable {
    
}

extension Testable where Self : Codable {
    func json() throws -> String {
        let data = try JSONEncoder().encode(self)
        guard let json = String(data: data, encoding: .utf8) else {
            throw TestErrors.utf8Encoding
        }
        return json
    }
    
    func dictionary() throws -> [String : Any] {
        let json = try self.json()
        
        guard let data = json.data(using: .utf8) else {
            throw TestErrors.utf8Encoding
        }
        
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? [String : Any] else {
            throw TestErrors.serialization
        }
        
        return dictionary
    }
    
    static func make(with json: String) throws -> Self {
        guard let data = json.data(using: .utf8) else {
            throw TestErrors.utf8Encoding
        }
        
        return try JSONDecoder().decode(self, from: data)
    }
}

extension Calendar {
    static var gregorian: Calendar {
        return Calendar(identifier: .gregorian)
    }
}

extension TimeZone {
    static var gmt: TimeZone {
        return TimeZone(secondsFromGMT: 0)!
    }
}
