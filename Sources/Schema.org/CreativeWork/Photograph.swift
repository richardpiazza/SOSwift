import Foundation

public protocol PhotographConformance:
                    ImageObjectOrPhotograph
                {}

/// A photograph.
public protocol Photograph: CreativeWork, PhotographConformance {
    
}
