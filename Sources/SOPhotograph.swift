import Foundation
import SOSwiftVocabulary

/// A photograph.
public class SOPhotograph: SOCreativeWork, Photograph {
    
    override public class var type: String {
        return "Photograph"
    }
}
