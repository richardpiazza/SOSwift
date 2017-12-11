import Foundation

public protocol WebsiteConformance:
                    SoftwareApplicationOrWebsite
                {}

/// A WebSite is a set of related web pages and other items typically served from a single web domain and accessible via URLs.
public protocol Website: CreativeWork, WebsiteConformance {
    /// The International Standard Serial Number (ISSN) that identifies this serial publication. You can repeat this property to identify different formats of, or the linking ISSN (ISSN-L) for, this serial publication.
    var issn: String? { get set }
}
