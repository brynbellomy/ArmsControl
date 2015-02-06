////
////  ProximityTriggerNodeBuilder.swift
////  ArmsControl
////
////  Created by bryn austin bellomy on 2015 Jan 13.
////  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
////
//
//import Foundation
//import SpriteKit
//import SwiftConfig
//import SwiftBitmask
//import Funky
//import LlamaKit
//import GameObjects
//
//
//public struct ProximityTriggerNodeBuilder <T: ITriggerCategoryType where T.BitmaskRawType == UInt32> : IConfigurableBuilder
//{
//    public var physicsBody: SKPhysicsBody?
//    public var triggerCategories: Bitmask<T>?
//
//    public init() {}
//
//    public mutating func configure(config: Config) {
//        triggerCategories =?? config.get("trigger categories")
//        physicsBody       =?? config.get("physics body", builder:SKPhysicsBodyBuilder<T>())
//    }
//
//    public mutating func build() -> Result<ProximityTriggerNode<T>> {
//        return buildNode <^> physicsBody       ?± failure("Could not build ProximityTriggerNode: expected value for 'trigger categories'.")
//                         <*> triggerCategories ?± failure("Could not build ProximityTriggerNode: expected value for 'trigger categories'.")
//
//    }
//}
//
//
//private func buildNode <T: ITriggerCategoryType where T.BitmaskRawType == UInt32>
//    (physicsBody:SKPhysicsBody) (triggerCategories:Bitmask<T>) -> ProximityTriggerNode<T>
//{
//    return ProximityTriggerNode<T>(physicsBody: physicsBody, triggerCategories: triggerCategories)
//}
//
//
//
