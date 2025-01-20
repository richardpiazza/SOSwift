import Foundation

public typealias PersonOrURL = SingleURLConjunction<Person>

public extension PersonOrURL {
    var person: Person? { first }

    static func person(value: Person) -> Self {
        .first(value)
    }
}
