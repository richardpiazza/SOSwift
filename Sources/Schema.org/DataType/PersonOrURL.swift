import Foundation

/// Person, URL
public protocol PersonOrURL {}

extension URL: PersonOrURL {}
