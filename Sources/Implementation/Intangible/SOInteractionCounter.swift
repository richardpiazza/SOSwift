import Foundation

public class SOInteractionCounter: SOStructuredValue, InteractionCounter {
    override public class var type: String {
        return "InteractionCounter"
    }
    
}
