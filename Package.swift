// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "WorkflowInVapor",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/stefanspringer1/SwiftWorkflow", from: "0.0.106"),
        .package(url: "https://github.com/stefanspringer1/SwiftLoggingBindingForWorkflow.git", from: "0.0.8"),
        .package(url: "https://github.com/tctony/FileLogHandler.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Workflow", package: "SwiftWorkflow"),
                "SwiftLoggingBindingForWorkflow",
                "FileLogHandler",
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
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
