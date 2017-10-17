import Foundation
import SOSwiftVocabulary

/// A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services. For describing demand using this type, the very same properties used for Offer apply.
public class SODemand: SOIntangible, Demand {
    
    public override class var type: String {
        return "Demand"
    }
    
}
