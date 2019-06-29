import XCTest
@testable import SOSwift

class MusicGroupOrPersonTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var musicGroup: MusicGroupOrPerson?
        var person: MusicGroupOrPerson?
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
        
        let musicGroup = MusicGroup()
        musicGroup.name = "The Beatles"
        testObject.musicGroup = .musicGroup(value: musicGroup)
        
        let person = Person()
        person.name = "Paul McCartney"
        testObject.person = .person(value: person)
        
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

