public typealias PlaceOrPostalAddressOrText = DoubleTextConjunction<Place, PostalAddress>

public extension PlaceOrPostalAddressOrText {
    var place: Place? { first }
    var postalAddress: PostalAddress? { second }
    
    static func place(value: Place) -> Self {
        .first(value)
    }
    
    static func postalAddress(value: PostalAddress) -> Self {
        .second(value)
    }
}
