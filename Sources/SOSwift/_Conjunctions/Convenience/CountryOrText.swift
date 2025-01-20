public typealias CountryOrText = SingleTextConjunction<Country>

public extension CountryOrText {
    var country: Country? { first }

    @available(*, deprecated, renamed: "init(_:)")
    init(value: Country) {
        self = .first(value)
    }

    @available(*, deprecated, renamed: "init(_:)")
    init(value: String) {
        self = .last(value)
    }

    static func country(value: Country) -> Self {
        .first(value)
    }
}
