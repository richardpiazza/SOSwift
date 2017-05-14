import Foundation

public class SOAudience: SOThing, Audience {
    override public class var type: String {
        return "Audience"
    }
    
    /// The target group associated with a given audience (e.g. veterans, car owners, musicians, etc.).
    public var audienceType: String?
    /// The geographic area associated with the audience.
    public var geographicArea: AdministrativeArea?
}
