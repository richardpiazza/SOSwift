import Foundation

public extension Mirror {
    var variables: [(String, Any.Type)] {
        var variables = [(String, Any.Type)]()
        
        for child in children {
            variables.append((child.label!, Swift.type(of: child.value)))
        }
        
        if let superclassMirror = self.superclassMirror {
            variables.append(contentsOf: superclassMirror.variables)
        }
        
        return variables
    }
}
