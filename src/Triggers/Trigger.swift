//
//  Trigger.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 8.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import Signals

//
// proximity to point
// repeating/sine wave
// physics contact
//
//

/** A bitmask value indicating what types of nodes can trigger a given trigger. */
public protocol ITriggerCategoryType: IBitmaskRepresentable, IConfigRepresentable {
}



public protocol ITrigger
{
    typealias SignalType
//    typealias Element
//    var signal: HotSignal<Element> { get }

//    var signal: HotSignal<Bool> { get }
    var signal: Signal<SignalType> { get }
//    var conditionMet: Bool { get }
}

//public protocol IConditionTrigger: ITrigger
//{
//    var signal: HotSignal<Bool> { get }
//}



//public class Trigger
//{
//    public var triggerOnce = true
//
//    public init(triggerOnce t:Bool) {
//        triggerOnce = t
//    }
//
//    public func listen() {
//
//    }
//}

