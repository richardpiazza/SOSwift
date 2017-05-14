import Foundation

public class SOPublicationEvent: SOEvent, PublicationEvent {
    override public class var type: String {
        return "PublicationEvent"
    }
    
    /// A broadcast service associated with the publication event.
    public var publishedOn: BroadcastService?
}
