//
//  ProximityTriggerNode.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 9.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import Funky
import NodeBehaviors
import MoarNodes
import Signals
import GameObjects
import SwiftBitmask
import SwiftConfig
import LlamaKit
import Signals


public protocol ITriggerCategoryType: IBitmaskRepresentable, IConfigRepresentable {
}


public class ProximityTriggerNode
    <T: ITriggerCategoryType where T.BitmaskRawType == UInt32> : SKNode, ITrigger
{
    public typealias TriggerCategory = T

    /** This signal fires each time another physics body enters or leaves the proximity radius. */
    public let signal = Signal<(otherBody:SKPhysicsBody, contact:SKPhysicsContact)>()

    /** The bitmask of user-definable trigger categories that this trigger responds to. */
    public var triggerCategories = Bitmask<TriggerCategory>.allZeros

    // this is probably overkill, but it's so easy to curry these functions and apply the physics body arg that i just figured fuck it i'll cache 'em
//    private let contactInvolvesSelf: SKPhysicsContact -> Bool
//    private let getOtherBody: SKPhysicsContact -> SKPhysicsBody

    private var bodiesInProximity = [SKPhysicsBody]()

    public init(physicsBody body:SKPhysicsBody, triggerCategories trig:Bitmask<TriggerCategory>)
    {
        triggerCategories   = trig
//        contactInvolvesSelf = GameObjects.contactInvolvesBody(body)
//        getOtherBody        = GameObjects.bodyOtherThan(body)

        super.init()

        physicsBody = body
    }



    //
    // MARK: Behavior lifecycle
    //

    public func didMoveToComponent() {
        let physicsSignals = (scene as? Scene)?.physicalComponent.signals

        physicsSignals?.didBeginContact .listen(self, didBeginContact) .filter(GameObjects.contactInvolvesBody(physicsBody!))
        physicsSignals?.didEndContact   .listen(self, didEndContact)   .filter(GameObjects.contactInvolvesBody(physicsBody!))
    }


    public func willMoveFromComponent() {
        (scene as? Scene)?.physicalComponent.signals.didBeginContact.removeListener(self)
    }


    private func didBeginContact(contact:SKPhysicsContact) {
        let otherBody = GameObjects.bodyOtherThan(physicsBody!)(contact:contact)
        bodiesInProximity.append(otherBody)
        signal.fire((otherBody:otherBody, contact:contact))
    }

    private func didEndContact(contact:SKPhysicsContact)
    {
        let otherBody = GameObjects.bodyOtherThan(physicsBody!)(contact:contact)

        if let index = find(bodiesInProximity, otherBody) {
            bodiesInProximity.removeAtIndex(index)
        }
        else { fatalError("could not find body with whom i'm ending contact (ProximityTriggerNode)") }

        signal.fire((otherBody:otherBody, contact:contact))
    }


    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}




