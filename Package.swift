// swift-tools-version:5.7.1
import PackageDescription

let package = Package(
    name: "ServerKit",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        .package(
            url: "https://github.com/vapor/vapor.git",
            from: "4.0.0"
        ),
        .package(
            url: "https://github.com/multibar/CoreKit.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/BrettRToomey/Jobs.git",
            from: "1.1.2"
        )
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Jobs", package: "jobs"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "CoreKit", package: "CoreKit")
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .executableTarget(name: "Run", dependencies: [.target(name: "App")]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
