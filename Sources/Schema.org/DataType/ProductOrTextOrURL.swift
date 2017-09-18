import Foundation

/// Product, Text, URL
public protocol ProductOrTextOrURL {}

extension String: ProductOrTextOrURL {}

extension URL: ProductOrTextOrURL {}
