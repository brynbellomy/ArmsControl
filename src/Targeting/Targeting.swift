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





