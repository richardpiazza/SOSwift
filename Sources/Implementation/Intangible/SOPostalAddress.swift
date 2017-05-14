import Foundation

public class PostalAddress: ContactPoint, SchemaPostalAddress {
    override public class var type: String {
        return "PostalAddress"
    }
    
}
