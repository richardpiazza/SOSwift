import Foundation

/// A country.
public class SOCountry: SOAdministrativeArea, Country {
    override public class var type: String {
        return "Country"
    }
}
