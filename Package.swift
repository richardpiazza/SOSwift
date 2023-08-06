// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SOSwift",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3),
    ],
    products: [
        .library(
            name: "SOSwift",
            targets: ["SOSwift"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/richardpiazza/CodablePlus",
            .upToNextMinor(from: "0.4.0"))
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
