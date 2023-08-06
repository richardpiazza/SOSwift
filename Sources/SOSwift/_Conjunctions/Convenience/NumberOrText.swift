public typealias NumberOrText = SingleCodableTextConjunction<Number>

public extension NumberOrText {
    var number: Number? { first }
}
