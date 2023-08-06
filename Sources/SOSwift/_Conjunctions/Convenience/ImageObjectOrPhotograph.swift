public typealias ImageObjectOrPhotograph = SingleSchemaConjunction<ImageObject, Photograph>

public extension ImageObjectOrPhotograph {
    var imageObject: ImageObject? { first }
    var photograph: Photograph? { second }
    
    static func imageObject(value: ImageObject) -> Self {
        .first(value)
    }
    
    static func photograph(value: Photograph) -> Self {
        .second(value)
    }
}
