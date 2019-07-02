import Foundation

public class Audience: Thing {
    
    /// The target group associated with a given audience.
    /// - example: veterans, car owners, musicians, etc.
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
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AudienceCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
