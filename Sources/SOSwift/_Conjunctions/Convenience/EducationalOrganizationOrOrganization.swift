public typealias EducationalOrganizationOrOrganization = SingleSchemaConjunction<EducationalOrganization, Organization>

public extension EducationalOrganizationOrOrganization {
    var educationalOrganization: EducationalOrganization? { first }
    var organization: Organization? { second }

    static func educationalOrganization(value: EducationalOrganization) -> Self {
        .first(value)
    }

    static func organization(value: Organization) -> Self {
        .second(value)
    }
}
