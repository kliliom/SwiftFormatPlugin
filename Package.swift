// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftFormatPlugin",
    products: [
        .plugin(
            name: "SwiftFormatPlugin",
            targets: [
                "SwiftFormatPlugin",
            ]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "swiftformatplugin-binary",
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.54.5/swiftformat.artifactbundle.zip",
            checksum: "39b4530054003cf9c668b0f9391b977fc13215925aaaaa3038d6379099b8486d"
        ),
        .plugin(
            name: "SwiftFormatPlugin",
            capability: .buildTool(),
            dependencies: [
                "swiftformatplugin-binary"
            ]
        ),
    ]
)
