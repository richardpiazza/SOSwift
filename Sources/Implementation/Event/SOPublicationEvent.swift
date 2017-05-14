import Foundation

public class SOPublicationEvent: SOEvent, PublicationEvent {
    override public class var type: String {
        return "PublicationEvent"
    }
    
}
