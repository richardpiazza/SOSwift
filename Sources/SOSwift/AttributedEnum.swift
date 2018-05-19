import Foundation

public protocol AttributedEnum {
    static var allCases: [Self] { get }
    static var displayNames: [String] { get }
    var displayName: String { get }
    init?(displayName: String)
}

public extension AttributedEnum {
    public static func attributedEnumType(displayName: String) -> Self? {
        guard let type = self.init(displayName: displayName) else {
            return nil
        }
        
        return type
    }
    
    public static var displayNames: [String] {
        return allCases.map({ return $0.displayName })
    }
    
    public init?(displayName: String) {
        let match = Self.allCases.first { (`case`) -> Bool in
            return `case`.displayName == displayName
        }
        
        guard let `case` = match else {
            return nil
        }
        
        self = `case`
    }
}
