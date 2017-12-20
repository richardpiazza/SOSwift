import Foundation
import SOSwiftVocabulary

/// A PublicationEvent corresponds indifferently to the event of publication for a CreativeWork of any type e.g. a broadcast event, an on-demand event, a book/journal publication via a variety of delivery media.
public class SOPublicationEvent: SOEvent, PublicationEvent {
    
    public override class var type: String {
        return "PublicationEvent"
    }
    
    /// An agent associated with the publication event.
    public var publishedBy: OrganizationOrPerson?
    /// A broadcast service associated with the publication event.
    public var publishedOn: BroadcastService?
    
    private enum CodingKeys: String, CodingKey {
        case publishedBy
        case publishedOn
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.publishedBy = try container.decodeOrganizationOrPersonIfPresent(forKey: .publishedBy)
        self.publishedOn = try container.decodeIfPresent(SOBroadcastService.self, forKey: .publishedOn)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.publishedBy, forKey: .publishedBy)
        try container.encodeIfPresent(self.publishedOn, forKey: .publishedOn)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: PublicationEvent?, forKey key: K) throws {
        if let typedValue = value as? SOPublicationEvent {
            try self.encode(typedValue, forKey: key)
        }
    }
}
