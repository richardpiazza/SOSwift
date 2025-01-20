public typealias LanguageOrText = SingleTextConjunction<Language>

public extension LanguageOrText {
    var language: Language? { first }

    static func language(value: Language) -> Self {
        .first(value)
    }
}
