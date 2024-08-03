//
//  Main.swift
//  SwiftFormatPlugin
//
//  Created by Kristof Liliom on 03/08/2024.
//

import Foundation
import PackagePlugin

@main
struct SwiftFormatPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {
        let userConfig = try UserConfig.loadOrDefault(formDirectory: target.directory)

        let resolvedConfig = ResolvedConfig(
            from: userConfig,
            pluginWorkDirectory: context.pluginWorkDirectory,
            rootDirectory: target.directory,
            targetName: target.name
        )
        try resolvedConfig.prepareDirectories()

        return [
            .prebuildCommand(
                displayName: "Running SwiftFormat on target \(target.name)",
                executable: try context.tool(named: "swiftformat").path,
                arguments: resolvedConfig.args,
                outputFilesDirectory: resolvedConfig.outputDirectory
            )
        ]
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftFormatPlugin: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        let userConfig = try UserConfig.loadOrDefault(fromDirectory: context.xcodeProject.directory, for: target)

        let resolvedConfig = ResolvedConfig(
            from: userConfig,
            pluginWorkDirectory: context.pluginWorkDirectory,
            rootDirectory: context.xcodeProject.directory,
            targetName: target.displayName
        )
        try resolvedConfig.prepareDirectories()

        return [
            .prebuildCommand(
                displayName: "Running SwiftFormat on target \(target.displayName)",
                executable: try context.tool(named: "swiftformat").path,
                arguments: resolvedConfig.args,
                outputFilesDirectory: resolvedConfig.outputDirectory
            )
        ]
    }
}
#endif
