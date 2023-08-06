import XCTest
@testable import SOSwift

class ItemListOrMusicRecordingTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var itemList: ItemListOrMusicRecording?
        var musicRecording: ItemListOrMusicRecording?
        var multiple: [ItemListOrMusicRecording]?
    }
    
    func testDecode() throws {
        let json = """
            {
                "itemList" : {
                    "@type" : "ItemList",
                    "name" : "Item List"
                },
                "musicRecording" : {
                    "@type" : "MusicRecording",
                    "name" : "Music Recording"
                }
            }
        """
        
        let testObject = try TestClass.make(with: json)
        
        XCTAssertEqual(testObject.itemList?.itemList?.name, "Item List")
        XCTAssertEqual(testObject.musicRecording?.musicRecording?.name, "Music Recording")
    }
    
    func testEncode() throws {
        let testObject = TestClass()
        
        let itemList = ItemList()
        itemList.numberOfItems = 47
        testObject.itemList = .itemList(value: itemList)
        
        let musicRecording = MusicRecording()
        musicRecording.name = "Rebel in the Rye"
        testObject.musicRecording = .musicRecording(value: musicRecording)
        
        let dictionary = try testObject.asDictionary()
        
        let li = dictionary["itemList"] as? [String : Any]
        let liCount = li?["numberOfItems"] as? Int
        
        XCTAssertEqual(liCount, 47)
        
        guard let mr = dictionary["musicRecording"] as? [String : Any], let mrName = mr["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(mrName, "Rebel in the Rye")
    }
    
    func testEquatability() throws {
        
    }
}

