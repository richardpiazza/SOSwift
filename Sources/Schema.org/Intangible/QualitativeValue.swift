import Foundation

public protocol QualitativeValue: Enumeration {
    var additionalProperty: PropertyValue? { get set }
    var equal: QualitativeValue? { get set }
    var greater: QualitativeValue? { get set }
    var greaterOrEqual: QualitativeValue? { get set }
    var lesser: QualitativeValue? { get set }
    var lesserOrEqual: QualitativeValue? { get set }
    var nonEqual: QualitativeValue? { get set }
    var valueReference: ValueReference? { get set }
}
