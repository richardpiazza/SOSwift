import Foundation

public protocol ContactPointConformance:
                    ContactPointOrPlace
                {}

public protocol ContactPoint: StructuredValue, ContactPointConformance {
    
}
