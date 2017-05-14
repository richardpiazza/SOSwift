import Foundation

public protocol PhotographConformance:
                    ImageObjectOrPhotograph
                {}

public protocol Photograph: CreativeWork, PhotographConformance {
    
}
