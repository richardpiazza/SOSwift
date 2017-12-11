import Foundation

/// ListItem, Text, Thing
public protocol ListItemOrThingOrText {}

extension String: ListItemOrThingOrText {}
