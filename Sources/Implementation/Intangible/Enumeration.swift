import Foundation

/// Lists or enumerations—for example, a list of cuisines or music genres, etc.
public class Enumeration: Intangible, SchemaEnumeration {
    public override var type: String {
        return "Enumeration"
    }
}
