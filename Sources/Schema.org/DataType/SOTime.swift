import Foundation

/// A point in time recurring on multiple days in the form hh:mm:ss[Z|(+|-)hh:mm]
public protocol SchemaTime {
    
}

extension String: SchemaTime {
}
