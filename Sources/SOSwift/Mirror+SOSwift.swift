import Foundation

typealias Variable = (String, Any.Type, Bool, Bool, Any?)

extension Mirror {
    var variables: [Variable] {
        var variables = [Variable]()
        
        for child in children {
            var isOptional = false
            var isCollection = false
            
            var type = Swift.type(of: child.value)
            if let optionalChild = child.value as? OptionalProtocol {
                type = optionalChild.wrappedType
                isOptional = true
            }
            
            let typeString = String(describing: type)
            if typeString.contains("Array") || typeString.contains("Set") || typeString.contains("Dictionary") {
                isCollection = true
            }
            
            var childValue: AnyObject? = child.value as AnyObject
            let childType: AnyObject.Type = Swift.type(of: child.value as AnyObject)
            if childType is NSNull.Type {
                childValue = nil
            }
            
            variables.append((child.label!, type, isOptional, isCollection, childValue))
        }
        
        if let superclassMirror = self.superclassMirror {
            variables.append(contentsOf: superclassMirror.variables)
        }
        
        return variables
    }
}
