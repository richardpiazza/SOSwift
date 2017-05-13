import Foundation

/// A brand is a name used by an organization or business person for labeling a product, product group, or similar.
public class Brand: Intangible, SchemaBrand {
    override public var type: String {
        return "Brand"
    }
    
}
