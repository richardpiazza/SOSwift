import Foundation

/// A brand is a name used by an organization or business person for labeling a product, product group, or similar.
public class Brand: SOIntangible, SchemaBrand {
    override public class var type: String {
        return "Brand"
    }
    
}
