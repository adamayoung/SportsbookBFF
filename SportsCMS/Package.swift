// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SportsCMS",

    platforms: [
        .macOS(.v12)
    ],

    products: [
        .library(name: "SportsCMS", targets: ["SportsCMS"])
    ],

    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0")
    ],

    targets: [
        .target(
            name: "SportsCMS",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "SportsCMSTests",
            dependencies: [
                "SportsCMS"
            ]
        )
    ]
)
