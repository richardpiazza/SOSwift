import Foundation

/// Lists or enumerations—for example, a list of cuisines or music genres, etc.
public class SOEnumeration: SOIntangible, Enumeration {
    override public class var type: String {
        return "Enumeration"
    }
    
    override public class var specificTypes: [MakeableThing.Type] {
        return [SOQualitativeValue.self]
    }
}
