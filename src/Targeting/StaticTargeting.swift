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


public struct StaticTargeting: ITargeting
{
    let targets: [SKNode]

    public init(targets t:[SKNode])  { targets = t }
    public init(targets t:SKNode...) { targets = t }

    public func getTargets() -> [SKNode] {
        return targets
    }
}






