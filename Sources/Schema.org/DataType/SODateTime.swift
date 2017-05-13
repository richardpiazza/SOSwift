import Foundation

public protocol SchemaDateTime: SchemaDateOrDateTime, SchemaDateTimeOrTextOrURL {
    
}

extension String: SchemaDateTime {
}
