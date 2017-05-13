import Foundation

public protocol SchemaAction: SchemaThing {
    var actionStatus: ActionStatus? { get set }
    var agent: SchemaOrganizationOrPerson? { get set }
    var endTime: SchemaDateTime? { get set }
    var error: SchemaThing? { get set }
    var instrument: SchemaThing? { get set }
    var location: SchemaPlaceOrPostalAddressOrText? { get set }
    var object: SchemaThing? { get set }
    var participant: SchemaOrganizationOrPerson? { get set }
    var result: SchemaThing? { get set }
    var startTime: SchemaDateTime? { get set }
    var target: SchemaEntryPoint? { get set }
}
