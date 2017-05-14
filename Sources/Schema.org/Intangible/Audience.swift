import Foundation

/// Intended audience for an item, i.e. the group for whom the item was created.
public protocol Audience: Thing {
    /// The target group associated with a given audience (e.g. veterans, car owners, musicians, etc.).
    var audienceType: String? { get set }
    /// The geographic area associated with the audience.
    var geographicArea: AdministrativeArea? { get set }
}
