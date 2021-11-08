// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SportsbookBFF",

    platforms: [
       .macOS(.v10_15)
    ],

    products: [
        .executable(name: "SportsbookBFF", targets: ["SportsbookBFF"])
    ],

    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0"),
        .package(url: "https://github.com/alexsteinerde/graphql-kit.git", from: "2.0.0"),
        .package(url: "https://github.com/alexsteinerde/graphiql-vapor.git", from: "2.0.0")
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
                "Sportsbook"
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
            name: "Sportsbook",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "GBP",
                "SportsCMS"
            ]
        ),
        .testTarget(
            name: "SportsbookTests",
            dependencies: [
                "Sportsbook",
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),

        .target(
            name: "GBP",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "GBPTests",
            dependencies: [
                "GBP",
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),

        .target(
            name: "SportsCMS",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "SportsCMSTests",
            dependencies: [
                "SportsCMS",
                .product(name: "XCTVapor", package: "vapor")
            ]
        )
    ]
)
