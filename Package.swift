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
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.56.2/swiftformat.artifactbundle.zip",
            checksum: "f23cdf64fa80f278f6fd1358c27234c36e66e219c62fb1f1e3e09bf89bbbaf4d"
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
