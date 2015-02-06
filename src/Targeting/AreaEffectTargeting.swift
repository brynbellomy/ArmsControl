//
//  StaticTargeting.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 28.
//  Copyright (c) 2014 bryn austin bellomy. All rights reserved.
//

import Foundation
import SpriteKit


/**
    Targets nodes within a certain circular radius of a given point.
 */
public struct AreaEffectTargeting: ITargeting
{
    public var targetingSearchRoot: ITargetingSearchRoot

    public let radius: CGFloat
    public let positionClosure: () -> CGPoint

    public init(radius r:CGFloat, targetingSearchRoot tr: ITargetingSearchRoot, positionClosure pc: () -> CGPoint)
    {
        radius = r
        targetingSearchRoot = tr
        positionClosure = pc
    }

    public func getTargets() -> [SKNode]
    {
        let center = positionClosure()
        let radius = self.radius

        return targetingSearchRoot.getTargetableNodes().filter {
            return $0.position.distanceTo(center) <= radius
        }
    }
}




