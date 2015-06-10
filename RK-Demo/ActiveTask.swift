//
//  ActiveTask.swift
//  RK-Demo
//
//  Created by James Godwin on 09/06/2015.
//  Copyright (c) 2015 Science Practice. All rights reserved.
//

import Foundation
import ResearchKit

var spatialSpanMemoryTask: ORKTask {
    return ORKOrderedTask.spatialSpanMemoryTaskWithIdentifier("Spatial Span Memory", intendedUseDescription: "A simple spatial test", initialSpan: 3, minimumSpan: 2, maximumSpan: 9, playSpeed: 1.0, maxTests: 3, maxConsecutiveFailures: 3, customTargetImage: nil, customTargetPluralName: nil, requireReversal: false, options: nil)
}