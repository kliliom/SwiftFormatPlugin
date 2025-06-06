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
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.55.2/swiftformat.artifactbundle.zip",
            checksum: "3e5409d4a366b8b085b97bc4c56f4789227a9592b8d1e49b36693ee82c0fcb85"
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
