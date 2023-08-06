import XCTest
@testable import SOSwift

class AlignmentObjectOrCourseOrTextTests: XCTestCase {
    
    fileprivate class TestClass: Codable, Schema {
        var alignmentObject: AlignmentObjectOrCourseOrText?
        var course: AlignmentObjectOrCourseOrText?
        var text: AlignmentObjectOrCourseOrText?
    }
    
    func testDecode() throws {
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
        
        let testClass = try TestClass.make(with: json)
        XCTAssertEqual(testClass.alignmentObject?.alignmentObject?.name, "Alignment Object")
        XCTAssertEqual(testClass.alignmentObject?.alignmentObject?.alignmentType, "teaches")
        XCTAssertNil(testClass.alignmentObject?.course)
        XCTAssertNil(testClass.alignmentObject?.text)
        XCTAssertEqual(testClass.course?.course?.courseCode, "CS101")
        XCTAssertNil(testClass.course?.alignmentObject)
        XCTAssertNil(testClass.course?.text)
        XCTAssertEqual(testClass.text?.text, "Random")
        XCTAssertNil(testClass.text?.alignmentObject)
        XCTAssertNil(testClass.text?.course)
        
        let missingType = """
        {
            "alignmentObject": {
                "name": "Value"
            }
        }
        """
        
        XCTAssertThrowsError(try TestClass.make(with: missingType))
        
        let invalidType = """
        {
            "alignmentObject": {
                "@type": "AlIgNmEnTObJeCt"
                "name": "Value"
            }
        }
        """
        
        XCTAssertThrowsError(try TestClass.make(with: invalidType))
    }
    
    func testEncode() throws {
        let alignmentObject = AlignmentObject()
        alignmentObject.targetDescription = "I don't know what this is."
        
        let course = Course()
        course.courseCode = "123456"
        
        let testClass = TestClass()
        testClass.alignmentObject = AlignmentObjectOrCourseOrText(alignmentObject)
        testClass.course = AlignmentObjectOrCourseOrText(course)
        testClass.text = AlignmentObjectOrCourseOrText("Something")
        
        let dictionary = try testClass.asDictionary()
        
        let target = dictionary["alignmentObject"] as? [String : Any]
        let courseCode = dictionary["course"] as? [String : Any]
        let something = dictionary["text"] as? String
        
        XCTAssertEqual(target?["targetDescription"] as? String, "I don't know what this is.")
        XCTAssertEqual(courseCode?["courseCode"] as? String, "123456")
        XCTAssertEqual(something, "Something")
    }
}
