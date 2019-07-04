import XCTest
@testable import SOSwift

class GeoShapeOrPlaceOrTextTests: XCTestCase {
    
    static var allTests = [
        ("testSingleDecodes", testSingleDecodes),
        ("testSingleEncodes", testSingleEncodes),
        ("testMultipleDecodes", testMultipleDecodes),
        ("testMultipleEncodes", testMultipleEncodes),
    ]
    
    fileprivate class TestClass: Codable, Testable {
        var geoShape: GeoShapeOrPlaceOrText?
        var place: GeoShapeOrPlaceOrText?
        var text: GeoShapeOrPlaceOrText?
        var multiple: [GeoShapeOrPlaceOrText]?
    }
    
    func testSingleDecodes() throws {
        let json = """
        {
            "geoShape": {
                "@type": "GeoShape",
                "name": "Squircle"
            },
            "place": {
                "@type": "Place",
                "name": "Seattle"
            },
            "text": "Remember The Zune"
        }
        """
        
        let testObject = try TestClass.make(with: json)
        
        let geoShape = (testObject.geoShape as? GeoShapeOrPlaceOrText)?.geoShape
        let place = (testObject.place as? GeoShapeOrPlaceOrText)?.place
        let text = (testObject.text as? GeoShapeOrPlaceOrText)?.text
        
        XCTAssertEqual(geoShape?.name, "Squircle")
        XCTAssertEqual(place?.name, "Seattle")
        XCTAssertEqual(text, "Remember The Zune")
    }
    
    func testSingleEncodes() throws {
        let geoShape = GeoShape()
        geoShape.name = "Squircle"
        
        let place = Place()
        place.name = "Seattle"
        
        let text = "Remember The Zune"
        
        let testObject = TestClass()
        testObject.geoShape = GeoShapeOrPlaceOrText.geoShape(value: geoShape)
        testObject.place = GeoShapeOrPlaceOrText.place(value: place)
        testObject.text = GeoShapeOrPlaceOrText.text(value: text)
        
        let dictionary = try testObject.dictionary()
        
        let gs = dictionary["geoShape"] as? [String : Any]
        let p = dictionary["place"] as? [String : Any]
        let t = dictionary["text"] as? String
        
        XCTAssertEqual(gs?["name"] as? String, geoShape.name)
        XCTAssertEqual(p?["name"] as? String, place.name)
        XCTAssertEqual(t, text)
    }
    
    func testMultipleDecodes() throws {
        let json = """
        {
            "multiple": [
                {
                    "@type": "GeoShape",
                    "name": "Squircle"
                },
                {
                    "@type": "Place",
                    "name": "Seattle"
                },
                "Remember The Zune"
            ]
        }
        """
        
        let testObject = try TestClass.make(with: json)
        
        guard let multiple = testObject.multiple as? [GeoShapeOrPlaceOrText] else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 3)
        
        let geoShape = multiple[0].geoShape
        let place = multiple[1].place
        let text = multiple[2].text
        
        XCTAssertEqual(geoShape?.name, "Squircle")
        XCTAssertEqual(place?.name, "Seattle")
        XCTAssertEqual(text, "Remember The Zune")
    }
    
    func testMultipleEncodes() throws {
        let geoShape = GeoShape()
        geoShape.name = "Squircle"
        
        let place = Place()
        place.name = "Seattle"
        
        let text = "Remember The Zune"
        
        var multiple = [GeoShapeOrPlaceOrText]()
        multiple.append(.geoShape(value: geoShape))
        multiple.append(.place(value: place))
        multiple.append(.text(value: text))
        
        let testObject = TestClass()
        testObject.multiple = multiple
        
        let dictionary = try testObject.dictionary()
        
        let values = dictionary["multiple"] as? [Any]
        
        XCTAssertEqual(values?.count, 3)
        
        let gs = values?[0] as? [String : Any]
        let p = values?[1] as? [String : Any]
        let t = values?[2] as? String
        
        XCTAssertEqual(gs?["name"] as? String, geoShape.name)
        XCTAssertEqual(p?["name"] as? String, place.name)
        XCTAssertEqual(t, text)
    }
}