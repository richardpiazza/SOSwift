import Foundation
import SOSwiftVocabulary

/// A performance group, such as a band, an orchestra, or a circus.
public class SOPerformingGroup: SOOrganization, PerformingGroup {
    override public class var type: String {
        return "PerformingGroup"
    }
}
