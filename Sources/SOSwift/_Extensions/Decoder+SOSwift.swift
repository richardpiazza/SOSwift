import Foundation

internal extension Decoder {
    func stringContents() throws -> String {
        let container = try singleValueContainer()
        return try container.decode(String.self)
    }
    
    func urlContents() throws -> URL {
        let container = try singleValueContainer()
        return try container.decode(URL.self)
    }
}
