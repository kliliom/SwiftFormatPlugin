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
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.54.3/swiftformat.artifactbundle.zip",
            checksum: "b9d4e1a76449ab0c3beb3eb34fb3dcf396589afb1ee75764767a6ef541c63d67"
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
