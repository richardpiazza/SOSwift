import Foundation

/// PostalAddress, Text
public protocol PostalAddressOrText {}

extension String: PostalAddressOrText {}
