import Foundation

/// A photograph.
public class Photograph: CreativeWork, SchemaPhotograph {
    override public class var type: String {
        return "Photograph"
    }
}
