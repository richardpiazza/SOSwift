import Foundation
import SOSwiftVocabulary

/// A photograph.
public class SOPhotograph: SOCreativeWork, Photograph {
    
    public override class var type: String {
        return "Photograph"
    }
    
}
