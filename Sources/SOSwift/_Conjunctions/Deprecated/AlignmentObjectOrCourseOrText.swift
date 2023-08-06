public typealias AlignmentObjectOrCourseOrText = DoubleTextConjunction<AlignmentObject, Course>

public extension AlignmentObjectOrCourseOrText {
    var alignmentObject: AlignmentObject? { first }
    var course: Course? { second }
    var text: String? { last }
}
