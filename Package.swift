// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChocKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ChocKit",
            targets: ["ChocKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ChocKit",
            dependencies: [],
            path: "ChocKit/Sources") // Adjust path to ChocKit/Sources
    ]
)
