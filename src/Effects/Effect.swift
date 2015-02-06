//
//  Effect.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 27.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import SpriteKit

public enum TimeInterval
{
    case Momentary
    case Timed(duration:NSTimeInterval)
}

public protocol IEffectType: class
{
    /**
        Executes the effect on the given `targets`.

        :param: timeInterval Allows effects to alter their behavior depending on whether they are executed instantaneously or over a period of time.
        :param: targets The targets upon which the effect should attempt to execute.
    */
    func execute(timeInterval:TimeInterval, targets:[SKNode])
}


public class BlockEffect
{
    public typealias EffectClosure = (TimeInterval, [SKNode]) -> ()
    private var effectClosure: EffectClosure

    public init(effectClosure ec:EffectClosure) {
        effectClosure = ec
    }

    public func execute(timeInterval:TimeInterval, targets:[SKNode]) {
        effectClosure(timeInterval, targets)
    }
}
