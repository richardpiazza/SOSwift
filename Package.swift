// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SOSwift",
    products: [
        .library(name: "SOSwift", targets: ["SOSwift"]),
        .library(name: "SOSwift-ObjC", targets: ["SOSwift-ObjC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/richardpiazza/SOSwiftVocabulary", .upToNextMinor(from: "1.3.0"))
    ],
    targets: [
        .target(name: "SOSwift", dependencies: ["SOSwiftVocabulary"], path: "Sources/SOSwift"),
        .testTarget(name: "SOSwiftTests", dependencies: ["SOSwift"], path: "Tests/SOSwiftTests"),
        .target(name: "SOSwift-ObjC", dependencies: ["SOSwiftVocabulary-ObjC"], path: "Sources/SOSwift-ObjC"),
    ]
)
