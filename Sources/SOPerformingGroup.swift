import Foundation
import SOSwiftVocabulary

/// A performance group, such as a band, an orchestra, or a circus.
public class SOPerformingGroup: SOOrganization, PerformingGroup {
    
    public override class var type: String {
        return "PerformingGroup"
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: PerformingGroup?, forKey key: K) throws {
        if let typedValue = value as? SOPerformingGroup {
            try self.encode(typedValue, forKey: key)
        }
    }
}
