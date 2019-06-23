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
        
        private enum CodingKeys: String, CodingKey {
            case geoShape
            case place
            case text
            case multiple
        }
        
        init() {
            
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            geoShape = try container.decodeGeoShapeOrPlaceOrTextIfPresent(forKey: .geoShape)
            place = try container.decodeGeoShapeOrPlaceOrTextIfPresent(forKey: .place)
            text = try container.decodeGeoShapeOrPlaceOrTextIfPresent(forKey: .text)
            multiple = try container.decodeGeoShapesOrPlacesOrTextsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(geoShape, forKey: .geoShape)
            try container.encodeIfPresent(place, forKey: .place)
            try container.encodeIfPresent(text, forKey: .text)
            try container.encodeIfPresent(multiple, forKey: .multiple)
        }
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
        
        let geoShape = (testObject.geoShape as? SOGeoShapeOrPlaceOrText)?.geoShape
        let place = (testObject.place as? SOGeoShapeOrPlaceOrText)?.place
        let text = (testObject.text as? SOGeoShapeOrPlaceOrText)?.text
        
        XCTAssertEqual(geoShape?.name, "Squircle")
        XCTAssertEqual(place?.name, "Seattle")
        XCTAssertEqual(text, "Remember The Zune")
    }
    
    func testSingleEncodes() throws {
        let geoShape = SOGeoShape()
        geoShape.name = "Squircle"
        
        let place = SOPlace()
        place.name = "Seattle"
        
        let text = "Remember The Zune"
        
        let testObject = TestClass()
        testObject.geoShape = SOGeoShapeOrPlaceOrText.geoShape(value: geoShape)
        testObject.place = SOGeoShapeOrPlaceOrText.place(value: place)
        testObject.text = SOGeoShapeOrPlaceOrText.text(value: text)
        
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
        
        guard let multiple = testObject.multiple as? [SOGeoShapeOrPlaceOrText] else {
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
        let geoShape = SOGeoShape()
        geoShape.name = "Squircle"
        
        let place = SOPlace()
        place.name = "Seattle"
        
        let text = "Remember The Zune"
        
        var multiple = [SOGeoShapeOrPlaceOrText]()
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
