// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SOSwift",
    products: [
        .library(name: "SOSwift", targets: ["SOSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/SOSwiftVocabulary", .upToNextMinor(from: "1.1.0")),
    ],
    targets: [
        .target(name: "SOSwift", dependencies: ["SOSwiftVocabulary"], path: "Sources/SOSwift"),
        .testTarget(name: "SOSwiftTests", dependencies: ["SOSwift"], path: "Tests/SOSwiftTests")
    ]
)
