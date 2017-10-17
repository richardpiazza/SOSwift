import Foundation
import SOSwiftVocabulary

/// A country.
public class SOCountry: SOAdministrativeArea, Country {
    
    override public class var type: String {
        return "Country"
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }
}
