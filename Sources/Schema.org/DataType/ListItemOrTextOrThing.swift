import Foundation

/// ListItem, Text, Thing
public protocol ListItemOrTextOrThing {}

extension String: ListItemOrTextOrThing {}
