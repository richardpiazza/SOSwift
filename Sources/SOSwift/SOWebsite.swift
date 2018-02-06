import Foundation
import SOSwiftVocabulary

/// A WebSite is a set of related web pages and other items typically served from a single web domain and accessible via URLs.
public class SOWebsite: SOCreativeWork, Website {
    
    public override class var type: String {
        return "Website"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The International Standard Serial Number (ISSN) that identifies this serial publication. You can repeat this property to identify different formats of, or the linking ISSN (ISSN-L) for, this serial publication.
    public var issn: String?
    
    private enum CodingKeys: String, CodingKey {
        case issn
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.issn = try container.decodeIfPresent(String.self, forKey: .issn)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.issn, forKey: .issn)
        
        try super.encode(to: encoder)
    }
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.issn.rawValue:
            return "The International Standard Serial Number that identifies this serial publication."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.issn.rawValue:
            self.issn = value as? String
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Website?, forKey key: K) throws {
        if let typedValue = value as? SOWebsite {
            try self.encode(typedValue, forKey: key)
        }
    }
}
