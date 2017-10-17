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
        
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if let value = self.mapType {
            try container.encode(value.rawValue, forKey: .mapType)
        }
        
        let superEncoder = container.superEncoder()
        try super.encode(to: superEncoder)
    }
}
