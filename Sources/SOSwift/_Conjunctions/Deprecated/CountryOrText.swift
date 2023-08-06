public typealias CountryOrText = SingleTextConjunction<Country>

public extension CountryOrText {
    var country: Country? { first }
    var text: String? { last }
    
    init(value: Country) {
        self = .first(value)
    }
    
    init(value: String) {
        self = .last(value)
    }
    
    static func country(value: Country) -> Self {
        .first(value)
    }
    
    static func text(value: String) -> Self {
        .last(value)
    }
}
