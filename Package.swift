// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SOSwift",
    products: [
        .library(name: "SOSwift", targets: ["SOSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/SOSwiftVocabulary", .upToNextMinor(from: "1.6.0"))
    ],
    targets: [
        .target(name: "SOSwift", dependencies: ["SOSwiftVocabulary"], path: "Sources/SOSwift"),
        .testTarget(name: "SOSwiftTests", dependencies: ["SOSwift"], path: "Tests/SOSwiftTests"),
    ],
    swiftLanguageVersions: [.v4_2, .v5]
)
