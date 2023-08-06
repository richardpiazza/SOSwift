public typealias PostalAddressOrText = SingleTextConjunction<PostalAddress>

public extension PostalAddressOrText {
    var postalAddress: PostalAddress? { first }
    
    static func postalAddress(value: PostalAddress) -> Self {
        .first(value)
    }
}
