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
        .package(url: "https://github.com/vapor-community/vapor-aws-lambda-runtime.git", .upToNextMajor(from: "0.4.0"))
    ],

    targets: [
        .executableTarget(
            name: "SportsbookBFF",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "SportsbookApp"
            ]
        ),
        .executableTarget(
            name: "SportsbookBFFLambda",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "VaporAWSLambdaRuntime", package: "vapor-aws-lambda-runtime"),
                "SportsbookApp"
            ]
        ),

        .target(
            name: "SportsbookApp",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                "Sportsbook",
                "ISPSportsbook"
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .testTarget(
            name: "SportsbookAppTests",
            dependencies: [
                "SportsbookApp",
                "Sportsbook",
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),

        .target(
            name: "ISPSportsbook",
            dependencies: [
                "Sportsbook",
                "SCAN",
                "SMP",
                "SportsCMS",
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "ISPSportsbookTests",
            dependencies: [
                "ISPSportsbook",
                "Sportsbook",
                "SCAN",
                "SMP",
                "SportsCMS",
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),

        .target(
            name: "Sportsbook",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
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
        ),

        .target(
            name: "SportsCMS",
            dependencies: [
                "SportsCMSCore",
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "SportsCMSTests",
            dependencies: [
                "SportsCMS",
                .product(name: "XCTVapor", package: "vapor")
            ]
        ),

        .target(
            name: "SportsCMSCore",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(
            name: "SportsCMSCoreTests",
            dependencies: [
                "SportsCMS",
                .product(name: "XCTVapor", package: "vapor")
            ]
        )
    ]
)
