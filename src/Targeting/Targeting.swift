//
//  Targeting.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 28.
//  Copyright (c) 2014 bryn austin bellomy. All rights reserved.
//

import SpriteKit
import Funky
import SwiftLogger

public protocol ITargeting {
    func getTargets() -> [SKNode]
}

public protocol ITargetableRoot: class
{
    /** This function allows the scene to choose which nodes are relevant for targeting, excluding anything that cannot be affected by payloads, anything offscreen, etc. */
    func getTargetableNodes() -> [SKNode]
}


public struct StaticTargeting: ITargeting
{
    let targets: [SKNode]

    public init(targets t:[SKNode])  { targets = t }
    public init(targets t:SKNode...) { targets = t }

    public func getTargets() -> [SKNode] {
        return targets
    }
}


public struct AreaEffectTargeting: ITargeting
{
    public var targetableRoot: ITargetableRoot

//    public let center: CGPoint
    public let radius: CGFloat
    public let positionClosure: () -> CGPoint

    public init(radius r:CGFloat, targetableRoot tr: ITargetableRoot, positionClosure pc: () -> CGPoint)
    {
//        center = c
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

//        lllog(.Error, "Area Effect :: (radius = \(radius) / center = \(center.bk_shortDescription)) close nodes = \(targets)")
        return targets
    }
}




