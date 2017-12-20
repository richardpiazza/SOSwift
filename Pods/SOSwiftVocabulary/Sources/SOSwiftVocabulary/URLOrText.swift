import Foundation

/// Text, URL
public protocol URLOrText {}

extension String: URLOrText {}

extension URL: URLOrText {}
