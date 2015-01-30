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

public class PayloadableComponent
{
    public typealias Key = String

    private var incomingQueue       = Queue<(Key, Payload)>()
    private var activeTimedPayloads = Controller<String, Payload>() //TimedPayloadMetadata>()
    private var updateTimer         = UpdateTimer()


    public init()
    {
//        activeTimedPayloads.childDidMoveToController    = { $0.didMoveToComponent()    }
//        activeTimedPayloads.childWillMoveFromController = { $0.willMoveFromComponent() }
    }


    //
    // MARK: - Public interface
    //

//    mutating
    public func addPayload (payload: Payload, withKey key:Key) {
        let tuple = (key, payload)
        incomingQueue.append(tuple)
    }


//    mutating
    public func update(currentTime:NSTimeInterval)
    {
        let timeSinceLastUpdate = updateTimer.timeSinceLastUpdate
        updateTimer.update(currentTime)

        processIncomingQueue(currentTime)
        processActiveTimedPayloads(currentTime, timeSinceLastUpdate:timeSinceLastUpdate)

//        activeTimedPayloads.each { key, child in
//            lllog(.Debug, "Payload(\(key)) child.remaining = \(child.remaining)")
//        }
    }


    //
    // MARK: - Private helper methods
    //

//    mutating
    private func processActiveTimedPayloads(currentTime:NSTimeInterval, timeSinceLastUpdate:NSTimeInterval)
    {
        // using 'map' here because the payload.execute() method is potentially mutating
        activeTimedPayloads.map { _, child in
            var payload = child
            payload.execute(timeSinceLastUpdate)
            return payload
        }

        activeTimedPayloads.removeWhere { _, payload in
            payload.remaining <= 0
        }
    }


//    mutating
    private func processIncomingQueue(currentTime:NSTimeInterval)
    {
        while incomingQueue.count > 0
        {
            if var (key, payload) = incomingQueue.dequeue()
            {
                // run instantaneous Payloads once and discard them immediately
                // if (payload.duration == 0) {
                //     payload.execute(currentTime)
                // }

                // hold onto timed Payloads while they're Payload-ing
                // else {
                    let tuple = (NSUUID().UUIDString, payload) //TimedPayloadMetadata(payload:payload))
                    activeTimedPayloads.append(tuple)
                // }
            }
        }
    }


    //
    // MARK: - Private payload wrapper struct
    //

//    private struct TimedPayloadMetadata
//    {
//        var remaining: NSTimeInterval
//        var payload:   Payload
//
//        private init(payload p:Payload)
//        {
//            payload = p
//
//            switch payload.duration {
//                case .Momentary: remaining = 0
//                case let .Timed(duration): remaining = duration
//            }
//        }
//    }
}








