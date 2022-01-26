// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GBP",

    platforms: [
        .macOS(.v12)
    ],

    products: [
        .library(name: "FBR", targets: ["FBR"]),
        .library(name: "SCAN", targets: ["SCAN"]),
        .library(name: "SIB", targets: ["SIB"]),
        .library(name: "SMP", targets: ["SMP"])
    ],

    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0")
    ],

    targets: [
        .target(
            name: "FBR",
            dependencies: [
                "GBPCore",
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "FBRTests",
            dependencies: [
                "FBR",
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),

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
            name: "SIB",
            dependencies: [
                "GBPCore",
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "SIBTests",
            dependencies: [
                "SIB",
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
                "SMP",
                .product(name: "XCTVapor", package: "vapor")
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
