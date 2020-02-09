// swift-tools-version:5.1

/**
 *  https://github.com/tadija/ae
 *  Copyright © 2020 Marko Tadić
 *  Licensed under the MIT license
 */

import PackageDescription

let package = Package(
    name: "AE",
    products: [
        .executable(
            name: "ae",
            targets: ["Cli"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/tadija/AETool.git", from: "0.1.0"
        ),
    ],
    targets: [
        .target(
            name: "Cli",
            dependencies: ["AETool", "My"]
        ),
        .target(
            name: "My",
            dependencies: [
                "AETool",
            ]
        ),
    ]
)
