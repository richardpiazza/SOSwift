import Foundation
import SOSwiftVocabulary

/// A map.
public class SOMap: SOCreativeWork, Map {

    public override class var type: String {
        return "Map"
    }
    
    /// Indicates the kind of Map, from the MapCategoryType Enumeration.
    public var mapType: MapType?
    
    private enum CodingKeys: String, CodingKey {
        case mapType
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(String.self, forKey: .mapType) {
            self.mapType = MapType(rawValue: value)
        }
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.mapType {
            try container.encode(value.rawValue, forKey: .mapType)
        }
        
        try super.encode(to: encoder)
    }
}
