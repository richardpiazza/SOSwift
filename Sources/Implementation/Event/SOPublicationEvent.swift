import Foundation

public class SOPublicationEvent: SOEvent, PublicationEvent {
    public struct Keys {
        public static let publishedOn = "publishedOn"
    }
    
    override public class var type: String {
        return "PublicationEvent"
    }
    
    /// A broadcast service associated with the publication event.
    public var publishedOn: BroadcastService?
    
    public required init(dictionary: [String : AnyObject]) {
        super.init(dictionary: dictionary)
        if let value = dictionary[Keys.publishedOn] as? [String : AnyObject] {
            self.publishedOn = SOBroadcastService(dictionary: value)
        }
    }
    
    override public var dictionary: [String : AnyObject] {
        var dictionary = super.dictionary
        if let value = self.publishedOn as? SOBroadcastService {
            dictionary[Keys.publishedOn] = value.dictionary as AnyObject
        }
        return dictionary
    }
}
