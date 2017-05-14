import Foundation

public protocol PostalAddressConformance:
                    PostalAddressOrText,
                    PlaceOrPostalAddressOrText
                {}

public protocol PostalAddress: ContactPoint, PostalAddressConformance {
    
}
