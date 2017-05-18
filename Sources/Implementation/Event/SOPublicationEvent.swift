import Foundation

public class SOPublicationEvent: SOEvent, PublicationEvent {
    override public class var type: String {
        return "PublicationEvent"
    }
    
    /// A broadcast service associated with the publication event.
    public var publishedOn: BroadcastService?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        
        return dictionary
    }
}
