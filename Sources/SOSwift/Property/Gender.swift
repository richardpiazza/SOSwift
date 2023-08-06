/// Gender of something, typically a Person, but possibly also fictional characters, animals, etc.
public typealias Gender = SingleCodableTextConjunction<GenderType>

public extension Gender {
    var genderType: GenderType? { first }
}
