public typealias SoftwareApplicationOrWebsite = SingleSchemaConjunction<SoftwareApplication, Website>

public extension SoftwareApplicationOrWebsite {
    var softwareApplication: SoftwareApplication? { first }
    var website: Website? { second }
    
    static func softwareApplication(value: SoftwareApplication) -> Self {
        .first(value)
    }
    
    static func website(value: Website) -> Self {
        .second(value)
    }
}
