import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class MusicGroupOrPersonTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var musicGroup: MusicGroupOrPerson?
        var person: MusicGroupOrPerson?
        
        private enum CodingKeys: String, CodingKey {
            case musicGroup
            case person
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.musicGroup = try container.decodeMusicGroupOrPersonIfPresent(forKey: .musicGroup)
            self.person = try container.decodeMusicGroupOrPersonIfPresent(forKey: .person)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.musicGroup, forKey: .musicGroup)
            try container.encodeIfPresent(self.person, forKey: .person)
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
    
    func testSingleDecodes() {
        let json = """
            {
                "musicGroup" : {
                    "@type" : "MusicGroup",
                    "name" : "Young Beautiful in a Hurry"
                },
                "person" : {
                    "@type" : "Person",
                    "name" : "Brendan McCreary"
                }
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let musicGroup = testObject.musicGroup as? MusicGroup else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(musicGroup.name, "Young Beautiful in a Hurry")
        
        guard let person = testObject.person as? Person else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(person.name, "Brendan McCreary")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let musicGroup = SOMusicGroup()
        musicGroup.name = "The Beatles"
        testObject.musicGroup = musicGroup
        
        let person = SOPerson()
        person.name = "Paul McCartney"
        testObject.person = person
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let mg = dictionary["musicGroup"] as? [String : Any], let mgName = mg["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(mgName, "The Beatles")
        
        guard let p = dictionary["person"] as? [String : Any], let pName = p["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(pName, "Paul McCartney")
    }
}

