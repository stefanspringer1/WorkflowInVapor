import Vapor
import Workflow

func routes(_ app: Application) throws {
    app.get { req async -> String in
        let execution = Execution(logger: executionLogger!, applicationName: appName)
        let message = await messageMaker_step(during: execution, usingExecutionDatabase: ExecutionDatabase())
        app.logger.info("responding...")
        return message
    }
}
