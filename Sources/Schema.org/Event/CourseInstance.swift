import Foundation

public protocol CourseInstance: Event {
    var courseMode: TextOrURL? { get set }
    var instructor: Person? { get set }
}
