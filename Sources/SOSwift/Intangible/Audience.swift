import Foundation

/// Intended audience for an item, i.e. the group for whom the item was created.
public class Audience: Thing {
    
    /// The target group associated with a given audience.
    ///
    /// ## For Example
    /// * Veterans
    /// * Car Owners
    /// * Musicians
    public var audienceType: String?
    
    /// The geographic area associated with the audience.
    public var geographicArea: AdministrativeArea?
    
    internal enum AudienceCodingKeys: String, CodingKey {
        case audienceType
        case geographicArea
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: AudienceCodingKeys.self)
        
        audienceType = try container.decodeIfPresent(String.self, forKey: .audienceType)
        geographicArea = try container.decodeIfPresent(AdministrativeArea.self, forKey: .geographicArea)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AudienceCodingKeys.self)
        
        try container.encodeIfPresent(audienceType, forKey: .audienceType)
        try container.encodeIfPresent(geographicArea, forKey: .geographicArea)
        
        try super.encode(to: encoder)
    }
}
