import Vapor
import Workflow

public var port = 8080
public var log: String? = nil
public var executionLogger: Workflow.Logger? = nil
public var appName = "WorkflowInVapor"

// to be called in Run/main.swift before anything else
public func processArguments() {
    var newCommandLineArguments = [String]()
    var argumentName: Substring? = nil
    CommandLine.arguments.forEach { argument in
        if argument.hasPrefix("--") {
            if let theArgumentName = argumentName {
                newCommandLineArguments.append("--\(theArgumentName)")
            }
            argumentName = argument.dropFirst(2)
        }
        else if let theArgumentName = argumentName {
            switch theArgumentName {
            case "port":
                port = Int(argument) ?? port
            case "log":
                log = argument
            default:
                newCommandLineArguments.append("--\(theArgumentName)")
                newCommandLineArguments.append(argument)
            }
            argumentName = nil
        }
        else {
            newCommandLineArguments.append(argument)
        }
    }
    CommandLine.arguments = newCommandLineArguments
}

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.http.server.configuration.port = port
    
    // register routes
    try routes(app)
}
