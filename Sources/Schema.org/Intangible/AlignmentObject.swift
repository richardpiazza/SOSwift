import Foundation

public protocol AlignmentObjectConformance:
                    AlignmentObjectOrCourseOrText
                {}

public protocol SchemaAlignmentObject: Intangible, AlignmentObjectConformance {
    
}
