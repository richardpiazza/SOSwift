import Foundation

public protocol AlignmentObjectConformance:
                    AlignmentObjectOrCourseOrText
                {}

public protocol AlignmentObject: Intangible, AlignmentObjectConformance {
    
}
