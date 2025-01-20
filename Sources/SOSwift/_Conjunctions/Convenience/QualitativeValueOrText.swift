public typealias QualitativeValueOrText = SingleTextConjunction<QualitativeValue>

public extension QualitativeValueOrText {
    var qualitativeValue: QualitativeValue? { first }

    static func qualitativeValue(value: QualitativeValue) -> Self {
        .first(value)
    }
}
