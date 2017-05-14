import Foundation

public protocol BrandConformance:
                    BrandOrOrganization
                {}

public protocol SchemaBrand: Intangible, BrandConformance {
}
