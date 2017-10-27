import XCTest
@testable import SOSwift
import SOSwiftVocabulary

class AlignmentObjectOrCourseOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var alignmentObject: AlignmentObjectOrCourseOrText?
        var course: AlignmentObjectOrCourseOrText?
        var text: AlignmentObjectOrCourseOrText?
        var multiple: [AlignmentObjectOrCourseOrText]?
        
        private enum CodingKeys: String, CodingKey {
            case alignmentObject
            case course
            case text
            case multiple
        }
        
        init() {
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.alignmentObject = try container.decodeAlignmentObjectOrCourseOrTextIfPresent(forKey: .alignmentObject)
            self.course = try container.decodeAlignmentObjectOrCourseOrTextIfPresent(forKey: .course)
            self.text = try container.decodeAlignmentObjectOrCourseOrTextIfPresent(forKey: .text)
            self.multiple = try container.decodeAlignmentObjectsOrCoursesOrTextsIfPresent(forKey: .multiple)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(self.alignmentObject, forKey: .alignmentObject)
            try container.encodeIfPresent(self.course, forKey: .course)
            try container.encodeIfPresent(self.text, forKey: .text)
            try container.encodeIfPresent(self.multiple, forKey: .multiple)
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
                "alignmentObject" : {
                    "@type" : "AlignmentObject",
                    "name" : "Alignment Object",
                    "alignmentType" : "teaches",
                    "educationalFramework" : "The Framework",
                    "targetDescription" : "Target Description",
                    "targetName" : "Target Name",
                    "targetUrl" : "https://www.google.com"
                },
                "course" : {
                    "@type" : "Course",
                    "courseCode" : "CS101"
                },
                "text" : "Random"
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let testable: TestClass
        do {
            testable = try JSONDecoder().decode(TestClass.self, from: data)
        } catch {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(testable.alignmentObject)
        XCTAssertTrue(testable.alignmentObject! is SOAlignmentObject)
        XCTAssertNotNil(testable.course)
        XCTAssertTrue(testable.course! is SOCourse)
        XCTAssertNotNil(testable.text)
        XCTAssertTrue(testable.text! is String)
    }

    func testMultipleDecodes() {
        let json = """
            {
                "multiple" : [
                    {
                        "@type" : "AlignmentObject",
                        "name" : "Alignment Object",
                        "alignmentType" : "teaches",
                        "educationalFramework" : "The Framework",
                        "targetDescription" : "Target Description",
                        "targetName" : "Target Name",
                        "targetUrl" : "https://www.google.com"
                    },
                    {
                        "@type" : "Course",
                        "courseCode" : "CS101"
                    },
                    "Random"
                ]
            }
        """
        
        guard let data = json.data(using: .utf8) else {
            XCTFail()
            return
        }
        
        let testable: TestClass
        do {
            testable = try JSONDecoder().decode(TestClass.self, from: data)
        } catch {
            XCTFail()
            return
        }
        
        guard let multiple = testable.multiple else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(multiple.count, 3)
        
        guard let _ = multiple[0] as? SOAlignmentObject else {
            XCTFail()
            return
        }
        
        guard let _ = multiple[1] as? SOCourse else {
            XCTFail()
            return
        }
        
        guard let _ = multiple[2] as? String else {
            XCTFail()
            return
        }
    }
}
