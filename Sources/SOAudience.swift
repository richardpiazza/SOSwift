import Foundation
import SOSwiftVocabulary

public class SOAudience: SOThing, Audience {
    override public class var type: String {
        return "Audience"
    }
    
    /// The target group associated with a given audience (e.g. veterans, car owners, musicians, etc.).
    public var audienceType: String?
    /// The geographic area associated with the audience.
    public var geographicArea: AdministrativeArea?
    
    private enum CodingKeys: String, CodingKey {
        case audienceType
        case geographicArea
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .audienceType) {
            self.audienceType = value
        }
        if let value = try container.decodeIfPresent(SOAdministrativeArea.self, forKey: .geographicArea) {
            self.geographicArea = value
        }
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.audienceType {
            try container.encode(value, forKey: .audienceType)
        }
        if let value = self.geographicArea as? SOAdministrativeArea {
            try container.encode(value, forKey: .geographicArea)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
