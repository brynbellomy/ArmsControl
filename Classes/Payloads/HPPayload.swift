//
//  HPPayload.swift
//  illumntr-the-game
//
//  Created by bryn austin bellomy on 2015 Jan 8.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import SpriteKit
import GameObjects


public protocol IMortal
{
    var existentialComponent: ExistentialComponent { get set }
}


public class HPPayload <N: SKNode where N: IMortal> : Payload<N>
{
    public typealias HPType = ExistentialComponent.HPType

    public var deltaHP: Double

    public init(durationType:DurationType, targetType:TargetType, deltaHP d:HPType)
    {
        deltaHP = d
        super.init(durationType: durationType, targetType: targetType)
    }

    override
    public func update(currentTime:NSTimeInterval, inout targets:[N])
    {
        switch durationType
        {
            case .Momentary:
                for (var target) in targets {
                    target.existentialComponent.HP += deltaHP
                }

            case .Timed:
                let timeScaledDeltaHP = deltaHP * currentTime
                for (var target) in targets {
                    target.existentialComponent.HP += timeScaledDeltaHP
                }

        }
    }
}
