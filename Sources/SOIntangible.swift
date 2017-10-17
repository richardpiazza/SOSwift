import Foundation
import SOSwiftVocabulary

/// A utility class that serves as the umbrella for a number of 'intangible' things such as quantities, structured values, etc.
public class SOIntangible: SOThing, Intangible {
    
    public override class var type: String {
        return "Intangible"
    }
    
}
