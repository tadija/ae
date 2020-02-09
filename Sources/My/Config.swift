/**
 *  https://github.com/tadija/ae
 *  Copyright © 2020 Marko Tadić
 *  Licensed under the MIT license
 */

import AECli
import AETool

public struct Config: ToolConfig {
    public var version: String {
        "0.1.0"
    }

    public var sourceURL: String {
        "https://github.com/tadija/ae.git"
    }

    public var sourceDIR: String {
        "~/.ae"
    }

    public var factory: ToolFactory {
        Factory()
    }

    public init() {}
}

public struct Factory: ToolFactory {
    public func makeCli() -> Cli {
        ToolCli(
            name: "ae",
            overview: "command line personal assistant",
            commands: makeCommands()
        )
    }
}
