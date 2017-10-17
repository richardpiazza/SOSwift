import Foundation
import SOSwiftVocabulary

/// A performance group, such as a band, an orchestra, or a circus.
public class SOPerformingGroup: SOOrganization, PerformingGroup {
    
    public override class var type: String {
        return "PerformingGroup"
    }
}
