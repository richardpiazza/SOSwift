public typealias PropertyValueOrText = SingleTextConjunction<PropertyValue>

public extension PropertyValueOrText {
    var propertyValue: PropertyValue? { first }

    static func propertyValue(value: PropertyValue) -> Self {
        .first(value)
    }
}
