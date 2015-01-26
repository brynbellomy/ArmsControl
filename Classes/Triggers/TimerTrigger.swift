//
//  TimerTrigger.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 8.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import UpdateTimer
import Signals


public struct TimerTrigger: ITrigger
{
    public var interval: NSTimeInterval
    private var updateTimer = UpdateTimer()

    public let signal = Signal<NSTimeInterval>()

    public init(interval i: NSTimeInterval, triggerOnce:Bool) {
        interval = i
    }


    public mutating func update(currentTime:NSTimeInterval)
    {
        updateTimer.update(currentTime)
        if updateTimer.timeSinceLastLap >= interval
        {
            updateTimer.lap()
        }
    }
}
