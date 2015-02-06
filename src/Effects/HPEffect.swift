//
//  HPEffect.swift
//  illumntr-the-game
//
//  Created by bryn austin bellomy on 2015 Jan 8.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import SpriteKit
import GameObjects
import UpdateTimer
import SwiftLogger
import Entish


/**
    Increases or decreases the hit points of its targets.  Targets must conform
    to the `IExistent` protocol (in [brynbellomy/GameObjects](https://github.com/brynbellomy/GameObjects)) to be affected by `HPEffect`.
 */
public class HPEffect: IEffectType
{
    /** The numeric type of the HP variable. */
    public typealias HPType = ExistentialComponent.HPType

    /** Represents the change in HP per second to apply to each target of this payload. */
    public var deltaHP: HPType


    /**
        The designated initializer.
        
        :param: deltaHP Represents the change in HP per second to apply to each target of this payload.
    */
    public init(deltaHP d:HPType) {
        deltaHP = d
    }

    /**
        Performs the effect on the given targets.  
    */
    public func execute(timeInterval:TimeInterval, targets:[SKNode])
    {
        switch timeInterval
        {
            case .Momentary:
                for (var target) in targets {
                    if var target = target as? IExistent {
                        let startingHP = target.existentialComponent.HP
                        target.existentialComponent.HP += deltaHP
                    }
                }

            case let .Timed(duration):
                let timeScaledDeltaHP = deltaHP * duration
                for (var target) in targets {
                    if var target = target as? IExistent {
                        target.existentialComponent.HP += timeScaledDeltaHP
                    }
                }
        }
    }
}




