import Foundation

public protocol DateTimeConformance:
                    DateOnlyOrDateTime,
                    DateTimeOrTextOrURL
                {}

/// A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (see Chapter 5.4 of ISO 8601).
public protocol DateTime: DateTimeConformance {}

extension String: DateTime {}
