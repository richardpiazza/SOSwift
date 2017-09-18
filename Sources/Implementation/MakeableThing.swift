import Foundation

public protocol MakeableThing: Thing {
    /// Specific Type subtypes
    static var specificTypes: [MakeableThing.Type] { get }
    
    /// Allow initialization with a dictionary representation.
    init(dictionary: [String : AnyObject])
    /// A dictionary representation of this object.
    var dictionary: [String : AnyObject] { get }
}

public extension MakeableThing {
    static func make(dictionary: [String : AnyObject]) -> Self {
        return self.init(dictionary: dictionary)
    }
}
