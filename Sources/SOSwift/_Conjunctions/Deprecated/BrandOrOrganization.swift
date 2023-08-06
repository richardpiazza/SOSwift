public typealias BrandOrOrganization = SingleSchemaConjunction<Brand, Organization>

public extension BrandOrOrganization {
    var brand: Brand? { first }
    var organization: Organization? { second }
    
    init(value: Brand) {
        self = .first(value)
    }
    
    init(value: Organization) {
        self = .second(value)
    }
}
