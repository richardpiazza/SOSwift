import Foundation

/// A `PublicationEvent` corresponds indifferently to the event of publication
/// for a `CreativeWork` of any type e.g. a broadcast event, an on-demand event,
/// a book/journal publication via a variety of delivery media.
public class PublicationEvent: Event {
    
    /// An agent associated with the publication event.
    public var publishedBy: OrganizationOrPerson?
    
    /// A broadcast service associated with the publication event.
    public var publishedOn: BroadcastService?
    
    internal enum PublicationEventCodingKeys: String, CodingKey {
        case publishedBy
        case publishedOn
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: PublicationEventCodingKeys.self)
        
        publishedBy = try container.decodeIfPresent(OrganizationOrPerson.self, forKey: .publishedBy)
        publishedOn = try container.decodeIfPresent(BroadcastService.self, forKey: .publishedOn)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PublicationEventCodingKeys.self)
        
        try container.encodeIfPresent(publishedBy, forKey: .publishedBy)
        try container.encodeIfPresent(publishedOn, forKey: .publishedOn)
        
        try super.encode(to: encoder)
    }
}
