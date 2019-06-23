import XCTest
@testable import SOSwift

class AlignmentObjectOrCourseOrTextTests: XCTestCase {

    fileprivate class TestClass: Codable, Testable {
        var alignmentObject: AlignmentObjectOrCourseOrText?
        var course: AlignmentObjectOrCourseOrText?
        var text: AlignmentObjectOrCourseOrText?
        var multiple: [AlignmentObjectOrCourseOrText]?
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
        XCTAssertTrue(testable.alignmentObject! is AlignmentObjectOrCourseOrText)
        switch testable.alignmentObject! as! AlignmentObjectOrCourseOrText {
        case .alignmentObject:
            break
        default:
            XCTFail()
        }
        
        XCTAssertNotNil(testable.course)
        XCTAssertTrue(testable.course! is AlignmentObjectOrCourseOrText)
        switch testable.course! as! AlignmentObjectOrCourseOrText {
        case .course:
            break
        default:
            XCTFail()
        }
        
        XCTAssertNotNil(testable.text)
        XCTAssertTrue(testable.text! is AlignmentObjectOrCourseOrText)
        switch testable.text! as! AlignmentObjectOrCourseOrText {
        case .text:
            break
        default:
            XCTFail()
        }
    }
    
    func testSingleEncodes() throws {
        
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
        
        guard let alignmentObject = multiple[0] as? AlignmentObjectOrCourseOrText else {
            XCTFail()
            return
        }
        
        switch alignmentObject {
        case .course, .text:
            XCTFail()
        default:
            break
        }
        
        guard let course = multiple[1] as? AlignmentObjectOrCourseOrText else {
            XCTFail()
            return
        }
        
        switch course {
        case .alignmentObject, .text:
            XCTFail()
        default:
            break
        }
        
        guard let text = multiple[2] as? AlignmentObjectOrCourseOrText else {
            XCTFail()
            return
        }
        
        switch text {
        case .alignmentObject, .course:
            XCTFail()
        default:
            break
        }
    }
    
    func testMultipleEncodes() throws {
        
    }
}
