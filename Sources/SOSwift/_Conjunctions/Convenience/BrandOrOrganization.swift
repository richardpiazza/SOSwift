public typealias BrandOrOrganization = SingleSchemaConjunction<Brand, Organization>

public extension BrandOrOrganization {
    var brand: Brand? { first }
    var organization: Organization? { second }

    @available(*, deprecated, renamed: "init(_:)")
    init(value: Brand) {
        self = .first(value)
    }

    @available(*, deprecated, renamed: "init(_:)")
    init(value: Organization) {
        self = .second(value)
    }
}
