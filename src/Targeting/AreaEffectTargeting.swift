//
//  StaticTargeting.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 28.
//  Copyright (c) 2014 bryn austin bellomy. All rights reserved.
//

import SpriteKit
import Funky
import SwiftLogger


public struct AreaEffectTargeting: ITargeting
{
    public var targetableRoot: ITargetableRoot

    public let radius: CGFloat
    public let positionClosure: () -> CGPoint

    public init(radius r:CGFloat, targetableRoot tr: ITargetableRoot, positionClosure pc: () -> CGPoint)
    {
        radius = r
        targetableRoot = tr
        positionClosure = pc
    }

    public func getTargets() -> [SKNode]
    {
        let center = positionClosure()
        let radius = self.radius

        let targets = targetableRoot.getTargetableNodes() |> select {
            return $0.position.distanceTo(center) <= radius
        }

        return targets
    }
}




