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
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.55.0/swiftformat.artifactbundle.zip",
            checksum: "83bf5673561eff20d407d6642e3572dfbd8e6c129eab66e950f361af424b0b0f"
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
