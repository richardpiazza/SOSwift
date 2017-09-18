import Foundation

/// Text, URL
public protocol TextOrURL {}

extension String: TextOrURL {}

extension URL: TextOrURL {}
