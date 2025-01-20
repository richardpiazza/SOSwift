import Foundation

/// A WebSite is a set of related web pages and other items typically served
/// from a single web domain and accessible via URLs.
public class Website: CreativeWork {

    /// The International Standard Serial Number (ISSN) that identifies
    /// this serial publication. You can repeat this property to identify different
    /// formats of, or the linking ISSN (ISSN-L) for, this serial publication.
    public var issn: String?

    enum WebsiteCodingKeys: String, CodingKey {
        case issn
    }

    override public init() {
        super.init()
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let container = try decoder.container(keyedBy: WebsiteCodingKeys.self)

        issn = try container.decodeIfPresent(String.self, forKey: .issn)
    }

    override public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: WebsiteCodingKeys.self)

        try container.encodeIfPresent(issn, forKey: .issn)

        try super.encode(to: encoder)
    }
}
