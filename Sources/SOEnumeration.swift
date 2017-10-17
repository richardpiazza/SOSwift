import Foundation
import SOSwiftVocabulary

/// Lists or enumerations—for example, a list of cuisines or music genres, etc.
public class SOEnumeration: SOIntangible, Enumeration {
    
    public override class var type: String {
        return "Enumeration"
    }
    
}
