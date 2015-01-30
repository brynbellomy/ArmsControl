//
//  PayloadComponent.swift
//  ArmsControl
//
//  Created by bryn austin bellomy on 2015 Jan 8.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import SpriteKit

import Funky
import BrynSwift
import SwiftDataStructures
import UpdateTimer
import SwiftLogger


public protocol IPayloadable {
    var payloadableComponent: PayloadableComponent { get }
}


//
// MARK: - class PayloadableComponent -
//

public struct PayloadableComponent
{
    public typealias Key = String

    private var incomingQueue       = Queue<(Key, Payload)>()
    private var activeTimedPayloads = Controller<String, Payload>()
    private var updateTimer         = UpdateTimer()


    public init()
    {
//        activeTimedPayloads.childDidMoveToController    = { $0.didMoveToComponent()    }
//        activeTimedPayloads.childWillMoveFromController = { $0.willMoveFromComponent() }
    }


    //
    // MARK: - Public interface
    //

    mutating
    public func addPayload (payload: Payload, withKey key:Key) {
        let tuple = (key, payload)
        incomingQueue.append(tuple)
    }


    mutating
    public func update(currentTime:NSTimeInterval)
    {
        let timeSinceLastUpdate = updateTimer.timeSinceLastUpdate
        updateTimer.update(currentTime)

        processIncomingQueue(currentTime)
        processActiveTimedPayloads(currentTime, timeSinceLastUpdate:timeSinceLastUpdate)
    }


    //
    // MARK: - Private helper methods
    //

    mutating
    private func processActiveTimedPayloads(currentTime:NSTimeInterval, timeSinceLastUpdate:NSTimeInterval)
    {
        // using 'map' here because the payload.execute() method is potentially mutating
        activeTimedPayloads.map { _, child in
            var payload = child
            payload.execute(timeSinceLastUpdate)
            return payload
        }

        // remove payloads that have expired
        activeTimedPayloads.removeWhere { _, payload in
            payload.remaining <= 0
        }
    }


    mutating
    private func processIncomingQueue(currentTime:NSTimeInterval)
    {
        while incomingQueue.count > 0
        {
            if var (key, payload) = incomingQueue.dequeue() {
                let tuple = (NSUUID().UUIDString, payload)
                activeTimedPayloads.append(tuple)
            }
        }
    }
}








