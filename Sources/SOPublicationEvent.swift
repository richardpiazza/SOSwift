import Foundation
import SOSwiftVocabulary

/// A PublicationEvent corresponds indifferently to the event of publication for a CreativeWork of any type e.g. a broadcast event, an on-demand event, a book/journal publication via a variety of delivery media.
public class SOPublicationEvent: SOEvent, PublicationEvent {
    
    public override class var type: String {
        return "PublicationEvent"
    }
    
    /// A broadcast service associated with the publication event.
    public var publishedOn: BroadcastService?
    
    private enum CodingKeys: String, CodingKey {
        case publishedOn
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(SOBroadcastService.self, forKey: .publishedOn) {
            self.publishedOn = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.publishedOn as? SOBroadcastService {
            try container.encode(value, forKey: .publishedOn)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
