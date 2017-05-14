import Foundation

public protocol ServiceConformance:
                    ProductOrService
                {}

public protocol Service: Intangible, ServiceConformance {
}
