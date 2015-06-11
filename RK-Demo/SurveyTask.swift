//
//  Survey.swift
//  RK-Demo
//
//  Created by James Godwin on 09/06/2015.
//  Copyright (c) 2015 Science Practice. All rights reserved.
//

import Foundation
import ResearchKit

var surveyTask: ORKTask {

    var steps = [ORKStep]()
    
    // Instruction step
    let instructionStep = ORKInstructionStep(identifier: "instructionStep")
    instructionStep.title = NSLocalizedString("Seizure Self Report", comment: "")
    instructionStep.text = "A report to provide details about a recent seizure"
    steps = steps + [instructionStep]
    
    // What time did the seizure happen?
    let timeAnswerFormat = ORKAnswerFormat.timeOfDayAnswerFormat()
    let timeQuestionStep = ORKQuestionStep(identifier: "timeAnswerQuestion", title: "Time of seizure", answer: timeAnswerFormat)
    timeQuestionStep.text = "What time did the seizure happen?"
    timeQuestionStep.optional = false
    steps = steps + [timeQuestionStep]
    
    // How long did the seizure last?
    let intervalAnswerFormat = ORKAnswerFormat.timeIntervalAnswerFormat()
    let timeIntervalStep = ORKQuestionStep(identifier: "intervalAnswerFormat", title: "Seizure Duration", answer: intervalAnswerFormat)
    timeIntervalStep.text = "How long did the seizure last?"
    timeIntervalStep.optional = false
    steps = steps + [timeIntervalStep]
    
    // Did you lose consciousness when it happened?
    let textChoiceOneText = NSLocalizedString("Yes", comment: "")
    let textChoiceTwoText = NSLocalizedString("No", comment: "")
    let textChoices = [
        ORKTextChoice(text: textChoiceOneText, value: "choice_1"),
        ORKTextChoice(text: textChoiceTwoText, value: "choice_2")
    ]
    
    let answerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
    let question1Step = ORKQuestionStep(identifier: "Question1Step", title: "Did you lose consciousness?", answer: answerFormat)
    question1Step.text = "Did you lose consciousness when it happened?"
    //question1Step.optional = false
    steps += [question1Step]
    
    // Please describe any other parts of the seizure in as much detail as you can
    let textAnswerFormat = ORKAnswerFormat.textAnswerFormat()
    let freeTextstep = ORKQuestionStep(identifier: "freeTextstep", title: "Other details", answer: ORKAnswerFormat.textAnswerFormat())
    freeTextstep.text = "Please note any other information regarding the seizure in as much detail as you can"
    steps += [freeTextstep]
    
    // Add a summary step.
    let summaryStep = ORKInstructionStep(identifier: "SummaryStep")
    summaryStep.title = NSLocalizedString("Thanks", comment: "")
    summaryStep.text = NSLocalizedString("Your report has been recorded", comment: "")
    
    steps += [summaryStep]
    return ORKOrderedTask(identifier: "SurveyStep", steps: steps)
}

