import Foundation

/// Text, Thing
public protocol ThingOrText {}

extension String: ThingOrText {}
