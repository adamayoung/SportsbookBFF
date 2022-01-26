// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SportsbookBFF",

    platforms: [
        .macOS(.v12)
    ],

    products: [
        .executable(name: "SportsbookBFF", targets: ["SportsbookBFF"])
    ],

    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0"),
        .package(url: "https://github.com/alexsteinerde/graphql-kit.git", from: "2.0.0"),
        .package(url: "https://github.com/alexsteinerde/graphiql-vapor.git", from: "2.0.0"),
        .package(name: "GBP", path: "./GBP"),
        .package(name: "SportsCMS", path: "./SportsCMS")
    ],

    targets: [
        .executableTarget(
            name: "SportsbookBFF",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .target(name: "SportsbookApp")
            ]
        ),

        .target(
            name: "SportsbookApp",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "GraphQLKit", package: "graphql-kit"),
                .product(name: "GraphiQLVapor", package: "graphiql-vapor"),
                "SportsbookCore"
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .testTarget(
            name: "SportsbookAppTests",
            dependencies: [
                .target(name: "SportsbookApp"),
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),

        .target(
            name: "SportsbookCore",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "FBR", package: "GBP"),
                .product(name: "SCAN", package: "GBP"),
                .product(name: "SIB", package: "GBP"),
                .product(name: "SMP", package: "GBP"),
                "SportsCMS"
            ]
        ),
        .testTarget(
            name: "SportsbookCoreTests",
            dependencies: [
                "SportsbookCore",
                .product(name: "XCTVapor", package: "vapor")
            ]
        )
    ]
)
