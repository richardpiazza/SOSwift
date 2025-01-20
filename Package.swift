// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SOSwift",
    platforms: [
        .macOS(.v12),
        .macCatalyst(.v15),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "SOSwift",
            targets: ["SOSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/CodablePlus", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SOSwift",
            dependencies: ["CodablePlus"]
        ),
        .testTarget(
            name: "SOSwiftTests",
            dependencies: ["SOSwift"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
