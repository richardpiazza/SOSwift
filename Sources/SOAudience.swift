import Foundation
import SOSwiftVocabulary

public class SOAudience: SOThing, Audience {
    
    public override class var type: String {
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
        
        self.audienceType = try container.decodeIfPresent(String.self, forKey: .audienceType)
        self.geographicArea = try container.decodeIfPresent(SOAdministrativeArea.self, forKey: .geographicArea)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.audienceType, forKey: .audienceType)
        try container.encodeIfPresent(self.geographicArea, forKey: .geographicArea)
        
        try super.encode(to: encoder)
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Audience?, forKey key: K) throws {
        if let typedValue = value as? SOAudience {
            try self.encode(typedValue, forKey: key)
        }
    }
}
