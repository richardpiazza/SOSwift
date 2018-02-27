import Foundation

public struct Attribute: Equatable {
    public var name: String
    public var type: Any.Type
    public var isOptional: Bool = false
    public var displayName: String?
    public var displayDescription: String?
    
    public init(name: String, type: Any.Type, isOptional: Bool = false) {
        self.name = name
        self.type = type
        self.isOptional = isOptional
    }
    
    public static func == (lhs: Attribute, rhs: Attribute) -> Bool {
        guard lhs.name == rhs.name else {
            return false
        }
        
        guard lhs.type == rhs.type else {
            return false
        }
        
        return true
    }
}

public protocol Attributed {
    func displayName(forAttributeNamed attributeName: String) -> String?
    func displayDescription(forAttributeNamed attributeName: String) -> String?
    func setValue(_ value: Any?, forAttributeNamed attributeName: String)
}

public extension Attributed {
    var attributes: [Attribute] {
        var attributes = [Attribute]()
        
        let mirror = Mirror(reflecting: self)
        for variable in mirror.variables {
            var attribute = Attribute(name: variable.0, type: variable.1, isOptional: variable.2)
            attribute.displayName = self.displayName(forAttributeNamed: variable.0)
            attribute.displayDescription = self.displayDescription(forAttributeNamed: variable.0)
            
            attributes.append(attribute)
        }
        
        return attributes.sorted(by: { (lhs, rhs) -> Bool in
            return lhs.name < rhs.name
        })
    }
    
    func attribute(named attributeName: String) -> Attribute? {
        return attributes.first(where: { (attribute) -> Bool in
            return attribute.name == attributeName
        })
    }
    
    func displayName(forAttribute attribute: Attribute) -> String? {
        return self.displayName(forAttributeNamed: attribute.name)
    }
    
    func displayDescription(forAttribute attribute: Attribute) -> String? {
        return self.displayDescription(forAttributeNamed: attribute.name)
    }
    
    func setValue(_ value: Any?, forAttribute attribute: Attribute) {
        self.setValue(value, forAttributeNamed: attribute.name)
    }
    
    func value(forAttributeNamed attributeName: String) -> Any? {
        let mirror = Mirror(reflecting: self)
        for variable in mirror.variables {
            if variable.0 == attributeName {
                return variable.2
            }
        }
        
        return nil
    }
    
    func value(forAttribute attribute: Attribute) -> Any? {
        return self.value(forAttributeNamed: attribute.name)
    }
}
