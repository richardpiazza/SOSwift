import Foundation

/// A service provided by an organization, e.g. delivery service, print services, etc.
public class Service: SOIntangible, SchemaService {
    override public class var type: String {
        return "Service"
    }
}
