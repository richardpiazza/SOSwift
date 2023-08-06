/// The frequency in MHz and the modulation used for a particular `BroadcastService`.
public class BroadcastFrequencySpecification: Intangible {
    
    /// The frequency in MHz for a particular broadcast.
    public var broadcastFrequencyValue: NumberOrQuantitativeValue?
    
    /// The modulation (e.g. FM, AM, etc) used by a particular broadcast service.
    public var broadcastSignalModulation: QualitativeValueOrText?
    
    /// The subchannel used for the broadcast.
    public var broadcastSubChannel: String?
    
    internal enum BroadcastFrequencySpecificationCodingKeys: String, CodingKey {
        case broadcastFrequencyValue
        case broadcastSignalModulation
        case broadcastSubChannel
    }
    
    public override init() {
        super.init()
    }
    
    public convenience init(
        broadcastFrequencyValue: NumberOrQuantitativeValue? = nil,
        broadcastSignalModulation: QualitativeValueOrText? = nil,
        broadcastSubChannel: String? = nil
    ) {
        self.init()
        self.broadcastFrequencyValue = broadcastFrequencyValue
        self.broadcastSignalModulation = broadcastSignalModulation
        self.broadcastSubChannel = broadcastSubChannel
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: BroadcastFrequencySpecificationCodingKeys.self)
        
        broadcastFrequencyValue = try container.decodeIfPresent(NumberOrQuantitativeValue.self, forKey: .broadcastFrequencyValue)
        broadcastSignalModulation = try container.decodeIfPresent(QualitativeValueOrText.self, forKey: .broadcastSignalModulation)
        broadcastSubChannel = try container.decodeIfPresent(String.self, forKey: .broadcastSubChannel)
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BroadcastFrequencySpecificationCodingKeys.self)
        
        try container.encodeIfPresent(broadcastFrequencyValue, forKey: .broadcastFrequencyValue)
        try container.encodeIfPresent(broadcastSignalModulation, forKey: .broadcastSignalModulation)
        try container.encodeIfPresent(broadcastSubChannel, forKey: .broadcastSubChannel)
        
        try super.encode(to: encoder)
    }
}
