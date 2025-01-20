import Foundation

public class DataFeed: Dataset {

    /// An item within in a data feed. Data feeds may have many elements.
    public var dataFeedElement: DataFeedItemOrThingOrText?

    enum DataFeedCodingKeys: String, CodingKey {
        case dataFeedElement
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: DataFeedCodingKeys.self)

        dataFeedElement = try container.decodeIfPresent(DataFeedItemOrThingOrText.self, forKey: .dataFeedElement)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DataFeedCodingKeys.self)

        try container.encodeIfPresent(dataFeedElement, forKey: .dataFeedElement)

        try super.encode(to: encoder)
    }
}
