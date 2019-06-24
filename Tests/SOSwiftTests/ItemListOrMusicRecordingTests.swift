import XCTest
@testable import SOSwift

class ItemListOrMusicRecordingTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Testable {
        var itemList: ItemListOrMusicRecording?
        var musicRecording: ItemListOrMusicRecording?
        var multiple: [ItemListOrMusicRecording]?
    }
    
    func testSingleDecodes() {
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
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let il = testObject.itemList as? ItemList else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(il.name, "Item List")
        
        guard let mr = testObject.musicRecording as? MusicRecording else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(mr.name, "Music Recording")
    }
    
    func testSingleEncodes() {
        let testObject = TestClass()
        
        let itemList = ItemList()
        itemList.numberOfItems = 47
        testObject.itemList = .itemList(value: itemList)
        
        let musicRecording = MusicRecording()
        musicRecording.name = "Rebel in the Rye"
        testObject.musicRecording = .musicRecording(value: musicRecording)
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let li = dictionary["itemList"] as? [String : Any], let liCount = li["numberOfItems"] as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(liCount, 47)
        
        guard let mr = dictionary["musicRecording"] as? [String : Any], let mrName = mr["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(mrName, "Rebel in the Rye")
    }
    
    func testMultipleDecodes() {
        let json = """
            {
                "multiple" : [
                    {
                        "@type" : "ItemList",
                        "name" : "Item List"
                    },
                    {
                        "@type" : "MusicRecording",
                        "name" : "Music Recording"
                    }
                ]
            }
        """
        
        let testObject: TestClass
        do {
            testObject = try TestClass.make(with: json)
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = testObject.multiple else {
            XCTFail()
            return
        }
        
        guard let itemList = multiple[0] as? ItemList else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(itemList.name, "Item List")
        
        guard let musicRecording = multiple[1] as? MusicRecording else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(musicRecording.name, "Music Recording")
    }
    
    func testMultipleEncodes() {
        let testObject = TestClass()
        
        let itemList = ItemList()
        itemList.numberOfItems = 47
        
        let musicRecording = MusicRecording()
        musicRecording.name = "Rebel in the Rye"
        
        testObject.multiple = [.itemList(value: itemList), .musicRecording(value: musicRecording)]
        
        let dictionary: [String : Any]
        do {
            dictionary = try testObject.dictionary()
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = dictionary["multiple"] as? [Any] else {
            XCTFail()
            return
        }
        
        guard let li = multiple[0] as? [String : Any], let liCount = li["numberOfItems"] as? Int else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(liCount, 47)
        
        guard let mr = multiple[1] as? [String : Any], let mrName = mr["name"] as? String else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(mrName, "Rebel in the Rye")
    }
}

