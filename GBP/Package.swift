// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GBP",

    platforms: [
        .macOS(.v12)
    ],

    products: [
        .library(name: "SCAN", targets: ["SCAN"]),
        .library(name: "SMP", targets: ["SMP"])
    ],

    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0")
    ],

    targets: [
        .target(
            name: "SCAN",
            dependencies: [
                "GBPCore",
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "SCANTests",
            dependencies: [
                "SCAN",
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),

        .target(
            name: "SMP",
            dependencies: [
                "GBPCore",
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "SMPTests",
            dependencies: [
                "SMP"
            ],
            resources: [
                .process("Resources")
            ]
        ),

        .target(
            name: "GBPCore",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "GBPCoreTests",
            dependencies: [
                "GBPCore",
                .product(name: "XCTVapor", package: "vapor")
            ]
        )
    ]
)
