import Foundation
import SOSwiftVocabulary

/// Properties that take Distances as values are of the form '<Number> <Length unit of measure>'. E.g., '7 ft'.
public class SODistance: SOQuantity, Distance {
    public override class var type: String {
        return "Distance"
    }
}
