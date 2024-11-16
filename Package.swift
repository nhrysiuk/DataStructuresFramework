// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataStructuresFramework",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataStructuresFramework",
            targets: ["DataStructuresFramework"]),
    ],
    
    dependencies: [
            .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.57.0")
        ],

    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataStructuresFramework",
            path: "Sources",
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
            ),
        .testTarget(
            name: "DataStructuresFrameworkTests",
            dependencies: ["DataStructuresFramework"],
            path: "Tests/DataStructuresFrameworkTests",
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")]
        ),
    ]
)
