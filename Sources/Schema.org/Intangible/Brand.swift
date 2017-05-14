import Foundation

public protocol BrandConformance:
                    BrandOrOrganization
                {}

public protocol Brand: Intangible, BrandConformance {
}
