import Foundation

public protocol DateOnlyConformance:
                    DateOnlyOrDateTime
                {}

/// A date value in ISO 8601 date format.
public protocol DateOnly: DateOnlyConformance {}

extension String: DateOnly {}
