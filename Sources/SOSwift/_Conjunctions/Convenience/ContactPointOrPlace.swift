public typealias ContactPointOrPlace = SingleSchemaConjunction<ContactPoint, Place>

public extension ContactPointOrPlace {
    var contactPoint: ContactPoint? { first }
    var place: Place? { second }
    
    @available(*, deprecated, renamed: "init(_:)")
    init(value: ContactPoint) {
        self = .first(value)
    }
    
    @available(*, deprecated, renamed: "init(_:)")
    init(value: Place) {
        self = .second(value)
    }
    
    static func contactPoint(value: ContactPoint) -> Self {
        .first(value)
    }
    
    static func place(value: Place) -> Self {
        .second(value)
    }
}
