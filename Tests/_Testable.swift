import Foundation
@testable import SOSwift
import SOSwiftVocabulary

enum TestErrors: Error {
    case utf8Encoding
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
    
    static func make(with json: String) throws -> Self {
        guard let data = json.data(using: .utf8) else {
            throw TestErrors.utf8Encoding
        }
        
        return try JSONDecoder().decode(self, from: data)
    }
}
