import Foundation

public protocol ServiceConformance:
                    ProductOrService
                {}

public protocol SchemaService: Intangible, ServiceConformance {
}
