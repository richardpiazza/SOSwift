import Foundation

public protocol OptionalProtocol {
    var wrappedType: Any.Type { get }
}

extension Optional: OptionalProtocol {
    public var wrappedType: Any.Type {
        return Wrapped.self
    }
}
