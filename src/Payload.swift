//
//  Payload.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 8.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation


public struct Payload
{
    let targeting: ITargeting
    var effect:    IEffectType
    let duration:  TimeInterval
    var remaining: NSTimeInterval

    public init(targeting t:ITargeting, effect e:IEffectType, duration d:TimeInterval) {
        targeting = t
        effect = e
        duration = d

        switch duration {
            case .Momentary:           remaining = 0
            case let .Timed(duration): remaining = duration
        }
    }

    public mutating func execute(timeSinceLastUpdate:NSTimeInterval)
    {
        let targets = targeting.getTargets()

        switch duration
        {
            case .Momentary:
                effect.execute(duration, targets:targets)

            case .Timed:
                let remainingTime = min(remaining, timeSinceLastUpdate)
                effect.execute(.Timed(duration:remainingTime), targets:targets)
        }
    }
}




//func example()
//{
//    let areaTargeting = AreaEffectTargeting(center:projectile.position, radius:10.0) { mapScene.gameObjectNodes }
//    let damageEffect  = HPEffect(deltaHP:-10)
//    let payload       = Payload(targeting:areaTargeting, effect:damageEffect, duration:.Momentary)
//    scene.addPayload(payload)
//}





