import Foundation

/// DateTime, Text, URL
public protocol DateTimeOrTextOrURL {}

extension String: DateTimeOrTextOrURL {}

extension URL: DateTimeOrTextOrURL {}
