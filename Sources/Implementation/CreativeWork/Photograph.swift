import Foundation

/// A photograph.
public class Photograph: CreativeWork, SchemaPhotograph {
    public override var type: String {
        return "Photograph"
    }
}
