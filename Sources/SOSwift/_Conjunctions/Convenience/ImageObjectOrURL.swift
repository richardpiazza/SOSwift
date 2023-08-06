import Foundation

public typealias ImageObjectOrURL = SingleURLConjunction<ImageObject>

public extension ImageObjectOrURL {
    var imageObject: ImageObject? { first }
    
    static func imageObject(value: ImageObject) -> Self {
        .first(value)
    }
}
