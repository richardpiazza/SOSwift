import Foundation

public protocol AttributedEnum: RawRepresentable {
    static var allCases: [Self] { get }
    var displayName: String { get }
}

public extension AttributedEnum {
    init?(displayName: String) {
        let match = Self.allCases.first { (`case`) -> Bool in
            return `case`.displayName == displayName
        }
        
        guard let `case` = match else {
            return nil
        }
        
        self = `case`
    }
}
