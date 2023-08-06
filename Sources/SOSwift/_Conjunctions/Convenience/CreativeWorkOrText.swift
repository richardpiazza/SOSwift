public typealias CreativeWorkOrText = SingleTextConjunction<CreativeWork>

public extension CreativeWorkOrText {
    var creativeWork: CreativeWork? { first }
    
    static func creativeWork(value: CreativeWork) -> Self {
        .first(value)
    }
}
