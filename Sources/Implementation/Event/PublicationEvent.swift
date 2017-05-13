import Foundation

public class PublicationEvent: Event, SchemaPublicationEvent {
    override public var type: String {
        return "PublicationEvent"
    }
    
}
