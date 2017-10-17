import Foundation
import SOSwiftVocabulary

/// A geographical region, typically under the jurisdiction of a particular government.
public class SOAdministrativeArea: SOPlace, AdministrativeArea {
    
    public override class var type: String {
        return "AdministrativeArea"
    }
    
}
