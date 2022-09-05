import App
import Vapor
import FileLogHandler
import SwiftLoggingBindingForWorkflow

processArguments()

var env = try Environment.detect()
let loggingLevel = try Logger.Level.detect(from: &env)

var logHandler: LogHandler = env == .production ? FileLogHandler(filePath: log!) : ConsoleLogger(label: appName, console: Terminal(), level: loggingLevel)
LoggingSystem.bootstrap { _ in logHandler }
executionLogger = SwiftLoggingBindingForWorkflow.SwiftLogger(logHandler: logHandler)

let app = Application(env)
defer { app.shutdown() }
try configure(app)
try app.run()
