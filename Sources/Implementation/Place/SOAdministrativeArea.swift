import Foundation

/// A geographical region, typically under the jurisdiction of a particular government.
public class SOAdministrativeArea: SOPlace, AdministrativeArea {
    override public class var type: String {
        return "AdministrativeArea"
    }
}
