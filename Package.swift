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
            .upToNextMinor(from: "0.3.0"))
    ],
    targets: [
        .target(
            name: "SOSwift",
            dependencies: ["CodablePlus"],
            path: "Sources/SOSwift"),
        .testTarget(
            name: "SOSwiftTests",
            dependencies: ["SOSwift"],
            path: "Tests/SOSwiftTests"),
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
