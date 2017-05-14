import Foundation

public class PublicationEvent: Event, SchemaPublicationEvent {
    override public class var type: String {
        return "PublicationEvent"
    }
    
}
