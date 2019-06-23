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
        .package(url: "https://github.com/richardpiazza/SOSwiftVocabulary", .upToNextMinor(from: "1.6.0"))
    ],
    targets: [
        .target(name: "SOSwift", dependencies: ["SOSwiftVocabulary"], path: "Sources/SOSwift"),
        //.testTarget(name: "SOSwiftTests", dependencies: ["SOSwift"], path: "Tests/SOSwiftTests"),
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
