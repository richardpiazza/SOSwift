import Foundation

/// Lists or enumerations—for example, a list of cuisines or music genres, etc.
public class Enumeration: SOIntangible, SchemaEnumeration {
    override public class var type: String {
        return "Enumeration"
    }
    
    override public class var specificTypes: [Thing.Type] {
        return [QualitativeValue.self]
    }
}
