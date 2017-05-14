import Foundation

/// CreativeWork, Product, URL
public protocol CreativeWorkOrProductOrURL {}

extension URL: CreativeWorkOrProductOrURL {}
