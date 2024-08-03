//
//  UserConfig.swift
//  SwiftFormatPlugin
//
//  Created by Kristof Liliom on 03/08/2024.
//

import Foundation
import PackagePlugin

struct UserConfig: Codable {
    var cacheDirectory: String?
    var sourceDirectory: String?
    var configFilePath: String?
}

extension UserConfig {
    static func loadOrDefault(formDirectory directory: Path) throws -> UserConfig {
        var userConfig = UserConfig()

        let configFilePath = directory.appending(".swiftformatplugin.json").string
        if FileManager.default.fileExists(atPath: configFilePath) {
            let data = try Data(contentsOf: URL(fileURLWithPath: configFilePath))
            userConfig = try JSONDecoder().decode(UserConfig.self, from: data)
        }

        return userConfig
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension UserConfig {

    static func loadOrDefault(fromDirectory directory: Path, for target: XcodeTarget) throws -> UserConfig {
        var userConfigs = [String: UserConfig]()

        let configFilePath = directory.appending(".swiftformatplugin.json").string
        if FileManager.default.fileExists(atPath: configFilePath) {
            let data = try Data(contentsOf: URL(fileURLWithPath: configFilePath))
            userConfigs = try JSONDecoder().decode([String: UserConfig].self, from: data)
        }

        return userConfigs[target.displayName] ?? UserConfig()
    }
}
#endif
