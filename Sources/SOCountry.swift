import Foundation
import SOSwiftVocabulary

/// A country.
public class SOCountry: SOAdministrativeArea, Country {
    
    public override class var type: String {
        return "Country"
    }
    
}
