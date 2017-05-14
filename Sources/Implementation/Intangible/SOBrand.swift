import Foundation

/// A brand is a name used by an organization or business person for labeling a product, product group, or similar.
public class SOBrand: SOIntangible, Brand {
    override public class var type: String {
        return "Brand"
    }
    
}
