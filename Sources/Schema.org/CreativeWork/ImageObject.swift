import Foundation

public protocol ImageObjectConformance:
                    ImageObjectOrURL,
                    ImageObjectOrPhotograph {}

public protocol ImageObject: MediaObject, ImageObjectConformance {
    
}
