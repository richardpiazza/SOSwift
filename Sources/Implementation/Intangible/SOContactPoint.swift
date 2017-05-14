import Foundation

public class SOContactPoint: SOStructuredValue, ContactPoint {
    override public class var type: String {
        return "ContactPoint"
    }
    
}
