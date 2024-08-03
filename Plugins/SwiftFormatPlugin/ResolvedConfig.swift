//
//  ResolvedConfig.swift
//  SwiftFormatPlugin
//
//  Created by Kristof Liliom on 03/08/2024.
//

import Foundation
import PackagePlugin

struct ResolvedConfig {
    var cacheDirectory: Path
    var sourceDirectory: Path
    var configFilePath: Path?
    var outputDirectory: Path
}

extension ResolvedConfig {
    init(
        from userConfig: UserConfig,
        pluginWorkDirectory pwd: Path,
        rootDirectory: Path,
        targetName: String
    ) {
        self.init(
            cacheDirectory: userConfig.cacheDirectory.map { pwd.appending(subpath: $0) }
            ?? pwd.appending("swiftformat-cache-\(targetName)"),
            sourceDirectory: userConfig.sourceDirectory.map { pwd.appending(subpath: $0) }
            ?? rootDirectory,
            configFilePath: userConfig.configFilePath.map { pwd.appending(subpath: $0) },
            outputDirectory: pwd.appending("swiftformat-output-\(targetName)")
        )
    }

    func prepareDirectories() throws {
        try FileManager.default.createDirectory(atPath: cacheDirectory.string, withIntermediateDirectories: true)
        try FileManager.default.createDirectory(atPath: outputDirectory.string, withIntermediateDirectories: true)
    }

    var args: [any CustomStringConvertible] {
        var args: [any CustomStringConvertible] = [
            "--lint",
            "--cache", cacheDirectory,
            sourceDirectory
        ]

        if let configFilePath = configFilePath {
            args.insert(configFilePath, at: 1)
            args.insert("--config", at: 1)
        }

        return args
    }
}
