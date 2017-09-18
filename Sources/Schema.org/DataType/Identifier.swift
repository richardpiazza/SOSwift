import Foundation

/// PropertyValue, Text, URL
public protocol Identifier {}

extension String: Identifier {}

extension URL: Identifier {}
