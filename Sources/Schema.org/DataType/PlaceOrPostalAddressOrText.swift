import Foundation

/// Place, PostalAddress, Text
public protocol PlaceOrPostalAddressOrText {}

extension String: PlaceOrPostalAddressOrText {}
