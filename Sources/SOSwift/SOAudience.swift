import Foundation
import SOSwiftVocabulary

public class SOAudience: SOThing, Audience {
    
    public override class var type: String {
        return "Audience"
    }
    
    public override class var dynamicSubtypes: [Dynamic.Type] {
        return []
    }
    
    /// The target group associated with a given audience (e.g. veterans, car owners, musicians, etc.).
    public var audienceType: String?
    /// The geographic area associated with the audience.
    public var geographicArea: AdministrativeArea?
    
    private enum CodingKeys: String, CodingKey {
        case audienceType
        case geographicArea
    }
    
    public override init() {
        super.init()
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
    
    // MARK: - Attributed
    public override func displayDescription(forAttributeNamed attributeName: String) -> String? {
        switch attributeName {
        case CodingKeys.audienceType.rawValue:
            return "The target group associated with a given audience."
        case CodingKeys.geographicArea.rawValue:
            return "The geographic area associated with the audience."
        default:
            return super.displayDescription(forAttributeNamed: attributeName)
        }
    }
    
    public override func setValue(_ value: Any?, forAttributeNamed attributeName: String) {
        switch attributeName {
        case CodingKeys.audienceType.rawValue:
            setAudienceType(value)
        case CodingKeys.geographicArea.rawValue:
            setGeographicArea(value)
        default:
            super.setValue(value, forAttributeNamed: attributeName)
        }
    }
}

public extension SOAudience {
    func setAudienceType(_ value: Any?) {
        guard let nonNil = value else {
            self.audienceType = nil
            return
        }
        
        guard let typedValue = nonNil as? String else {
            return
        }
        
        self.audienceType = typedValue
    }
    
    func setGeographicArea(_ value: Any?) {
        guard let nonNil = value else {
            self.geographicArea = nil
            return
        }
        
        guard let typedValue = nonNil as? AdministrativeArea else {
            return
        }
        
        self.geographicArea = typedValue
    }
}

public extension KeyedEncodingContainer {
    public mutating func encodeIfPresent(_ value: Audience?, forKey key: K) throws {
        if let typedValue = value as? SOAudience {
            try self.encode(typedValue, forKey: key)
        }
    }
}
