import Foundation

public extension Mirror {
    var variables: [(String, Any.Type, Any)] {
        var variables = [(String, Any.Type, Any)]()
        
        for child in children {
            variables.append((child.label!, Swift.type(of: child.value), child.value))
        }
        
        if let superclassMirror = self.superclassMirror {
            variables.append(contentsOf: superclassMirror.variables)
        }
        
        return variables
    }
}
