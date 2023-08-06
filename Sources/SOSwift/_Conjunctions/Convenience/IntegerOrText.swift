public typealias IntegerOrText = SingleCodableTextConjunction<Int>

public extension IntegerOrText {
    var integer: Int? { first }
}
