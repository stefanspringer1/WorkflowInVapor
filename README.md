# WorkflowInVapor

Example of using a [Workflow](https://github.com/stefanspringer1/SwiftWorkflow.git) in Vapor.

Use the following arguments when starting the application:

- If you want to set the port (default is 8080): `--port <port>`.
- If you want to set productive mode (and then writing the logs to a log file): `--env production`.
- If you run in productive mode, set the log file via `--log <log file>`.

When running the application from within Xcode, you should set the custom working directory (via “Edit Scheme”) to be the app directory.

In addition to using a workflow, this app shows:

- How to use additional arguments (e.g. the `--log` argument).
- How to differentiate between development and productive mode.
- How to log to a file.
