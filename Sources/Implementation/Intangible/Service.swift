import Foundation

/// A service provided by an organization, e.g. delivery service, print services, etc.
public class Service: Intangible, SchemaService {
    public override var type: String {
        return "Service"
    }
}
