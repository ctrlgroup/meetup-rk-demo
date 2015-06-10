//
//  ViewController.swift
//  RK-Demo
//
//  Created by James Godwin on 09/06/2015.
//  Copyright (c) 2015 Science Practice. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    @IBAction func beginConsentTask(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func beginActiveTask(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: spatialSpanMemoryTask, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func beginSurveyTask(sender: UIButton) {
        let taskViewController = ORKTaskViewController(task: surveyTask, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

}

