import Foundation
import SOSwiftVocabulary

public class SOPublicationEvent: SOEvent, PublicationEvent {
    
    override public class var type: String {
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
