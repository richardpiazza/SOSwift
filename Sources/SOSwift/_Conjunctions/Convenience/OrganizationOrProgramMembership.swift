public typealias OrganizationOrProgramMembership = SingleSchemaConjunction<Organization, ProgramMembership>

public extension OrganizationOrProgramMembership {
    var organization: Organization? { first }
    var programMembership: ProgramMembership? { second }
    
    static func organization(value: Organization) -> Self {
        .first(value)
    }
    
    static func programMembership(value: ProgramMembership) -> Self {
        .second(value)
    }
}
