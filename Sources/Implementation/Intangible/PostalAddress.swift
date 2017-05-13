import Foundation

public class PostalAddress: ContactPoint, SchemaPostalAddress {
    override public var type: String {
        return "PostalAddress"
    }
    
}
