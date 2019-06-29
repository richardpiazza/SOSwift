// swift-tools-version:5.0

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
        .library(name: "SOSwift", targets: ["SOSwift"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/richardpiazza/SOSwiftVocabulary", .upToNextMinor(from: "1.6.0"))
//        "SOSwiftVocabulary"
    ],
    targets: [
        .target(name: "SOSwift", dependencies: [], path: "Sources/SOSwift"),
        .testTarget(name: "SOSwiftTests", dependencies: ["SOSwift"], path: "Tests/SOSwiftTests", exclude: ["Tests/SOSwiftTests/ToBeRewritten"]),
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
