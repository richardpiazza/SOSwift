import Foundation
import SOSwiftVocabulary

/// A geographical region, typically under the jurisdiction of a particular government.
public class SOAdministrativeArea: SOPlace, AdministrativeArea {
    
    override public class var type: String {
        return "AdministrativeArea"
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}
