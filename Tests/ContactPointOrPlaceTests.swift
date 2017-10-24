import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class ContactPointOrPlaceTests: XCTestCase {

    fileprivate class Testable: Codable {
        var contactPoint: ContactPointOrPlace?
        var place: ContactPointOrPlace?
        
        private enum CodingKeys: String, CodingKey {
            case contactPoint
            case place
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.contactPoint = try container.decodeContactPointOrPlaceIfPresent(forKey: .contactPoint)
            self.place = try container.decodeContactPointOrPlaceIfPresent(forKey: .place)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.contactPoint, forKey: .contactPoint)
            try container.encodeIfPresent(self.place, forKey: .place)
        }
        
        
        internal enum Errors: Error {
            case utf8Encoding
        }
        
        func json() throws -> String {
            let data = try JSONEncoder().encode(self)
            guard let json = String(data: data, encoding: .utf8) else {
                throw Errors.utf8Encoding
            }
            return json
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    

}
