//
//  DynamicTargeting.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 30.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import SpriteKit


public struct DynamicTargeting: ITargeting
{
    let targetsClosure: () -> [SKNode]

    public init(targetsClosure tc:() -> [SKNode])  { targetsClosure = tc }

    public func getTargets() -> [SKNode] {
        return targetsClosure()
    }
}

