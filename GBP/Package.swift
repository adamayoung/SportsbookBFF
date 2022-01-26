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
                .product(name: "Vapor", package: "vapor"),
                "GBPShared"
            ]
        ),
        .testTarget(
            name: "FBRTests",
            dependencies: [
                "FBR"
            ]
        ),

        .target(
            name: "SCAN",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "GBPShared"
            ]
        ),
        .testTarget(
            name: "SCANTests",
            dependencies: [
                "SCAN"
            ]
        ),

        .target(
            name: "SIB",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "GBPShared"
            ]
        ),
        .testTarget(
            name: "SIBTests",
            dependencies: [
                "SIB"
            ]
        ),

        .target(
            name: "SMP",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "GBPShared"
            ]
        ),
        .testTarget(
            name: "SMPTests",
            dependencies: [
                "SMP"
            ]
        ),

        .target(
            name: "GBPShared",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "GBPSharedTests",
            dependencies: [
                "GBPShared"
            ]
        )
    ]
)
