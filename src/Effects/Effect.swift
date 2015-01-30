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
