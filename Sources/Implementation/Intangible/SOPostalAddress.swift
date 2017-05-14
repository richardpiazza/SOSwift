import Foundation

public class SOPostalAddress: SOContactPoint, PostalAddress {
    override public class var type: String {
        return "PostalAddress"
    }
    
}
