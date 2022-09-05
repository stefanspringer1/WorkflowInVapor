//
//  File.swift
//  
//
//  Created by Stefan Springer on 05.09.22.
//

import Foundation
import Workflow

func messageMaker_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase
) async -> String {
    var message = ""
    await execution.effectuate(executionDatabase, #function) {
        message = "It works!"
        await execution.log(stepData.createdMessage, message)
    }
    return message
}

/**
 The step data, including the error messages.
 */
fileprivate let stepData = ExportHTML_stepData.instance
struct ExportHTML_stepData: StepData {
    
    static let instance = ExportHTML_stepData()
    var stepDescription = "Transform TR to HTML."
    
    // Add non-static members of type Message here for all messages.
    // Only non-static members will be collected for the overview!
    
    let createdMessage = Message(
        id: "created message",
        type: .Info,
        fact: [
            .en: "created the message \"$1\"",
        ]
    )
}
