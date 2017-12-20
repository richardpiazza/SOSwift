import Foundation

/// Product, Text, URL
public protocol ProductOrURLOrText {}

extension String: ProductOrURLOrText {}

extension URL: ProductOrURLOrText {}
