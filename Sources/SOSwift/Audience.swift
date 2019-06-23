import Foundation

public class Audience: Thing {
    
    /// The target group associated with a given audience.
    /// - example: veterans, car owners, musicians, etc.
    public var audienceType: String?
    
    /// The geographic area associated with the audience.
    public var geographicArea: AdministrativeArea?
    
}
