import Foundation

/// A map.
public class Map: CreativeWork {
    
    /// Indicates the kind of Map, from the MapCategoryType Enumeration.
    public var mapType: MapType?
    
    internal enum MapCodingKeys: String, CodingKey {
        case mapType
    }
    
    public override init() {
        super.init()
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: MapCodingKeys.self)
        
        
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MapCodingKeys.self)
        
        
        
        try super.encode(to: encoder)
    }
}
