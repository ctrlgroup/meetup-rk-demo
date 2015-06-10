//
//  Consent.swift
//  RK-Demo
//
//  Created by James Godwin on 09/06/2015.
//  Copyright (c) 2015 Science Practice. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = NSLocalizedString("Consent", comment: "")
    consentDocument.signaturePageTitle = NSLocalizedString("Consent", comment: "")
    consentDocument.signaturePageContent = NSLocalizedString("I agree to participate in this research project.", comment: "")
    let participantSignatureTitle = NSLocalizedString("Participant", comment: "")
    let participantSignature = ORKConsentSignature(forPersonWithTitle: participantSignatureTitle, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature")
    
    consentDocument.addSignature(participantSignature)
    
    let consentSectionTypes: [ORKConsentSectionType] = [
        .Overview,
        .DataGathering,
        .Privacy,
        .DataUse,
        .TimeCommitment,
        .StudySurvey,
        .StudyTasks,
        .Withdrawing
    ]
    
    var consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        
        if consentSection.type == .Overview {
            consentSection.title = "Trial of Levetiracetam on patients with Refractory Partial Seizures"
            consentSection.summary = "Providing informed consent to take part in this 12 week trial"
            consentSection.content = ""
        }
        if consentSection.type == .DataGathering {
            let text = "Data will be gathered through self-reports and physical and neurologic examinations that will take place every 4 weeks."
            consentSection.summary = text
            consentSection.content = text
        }
        if consentSection.type == .Privacy {
            let text = "Your participation in the study will be treated as confidential. Your identity will not be disclosed to any person."
            consentSection.summary = text
            consentSection.content = text
        }
        if consentSection.type == .DataUse {
            let text = "Data collected during the study will only be used to study the efficacy of Levetircetam on Refractory Partial Seizures."
            consentSection.summary = text
            consentSection.content = text
        }
        if consentSection.type == .TimeCommitment {
            let text = "This is a 12 week study. You will also need to attend clinical examinations every 4 weeks."
            consentSection.summary = text
            consentSection.content = text
        }
        if consentSection.type == .StudySurvey {
            let text = "Your seizure self-report will require you to document the time, duration and description of each seizure during the 12 week trial. "
            consentSection.summary = text
            consentSection.content = text
        }
        if consentSection.type == .StudyTasks {
            let text = "You will need to take Levetiracetam oral medication twice everyday. You will also be required to complete a spatial memory task once everyday."
            consentSection.summary = text
            consentSection.content = text
        }
        if consentSection.type == .Withdrawing {
            let text = "You may withdraw from this trial at anytime."
            consentSection.summary = text
            consentSection.content = text
        }
        
        return consentSection
    }
    
    consentDocument.sections = consentSections
    return consentDocument
}

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    var consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    
    steps += [visualConsentStep]
    
    let signature = consentDocument.signatures!.first as! ORKConsentSignature
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, inDocument: consentDocument)
    
    reviewConsentStep.text = "Please provide your name"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}