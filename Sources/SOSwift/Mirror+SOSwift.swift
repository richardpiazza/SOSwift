import Foundation

public typealias Variable = (String, Any.Type, Bool, Any)

public extension Mirror {
    var variables: [Variable] {
        var variables = [Variable]()
        
        for child in children {
            var type = Swift.type(of: child.value)
            var isOptional = false
            if let optional = child.value as? OptionalProtocol {
                type = optional.wrappedType
                isOptional = true
            }
            variables.append((child.label!, type, isOptional, child.value))
        }
        
        if let superclassMirror = self.superclassMirror {
            variables.append(contentsOf: superclassMirror.variables)
        }
        
        return variables
    }
}
