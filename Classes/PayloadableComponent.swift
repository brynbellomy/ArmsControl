//
//  PayloadComponent.swift
//  illumntr-the-game
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


public protocol IPayloadable {
    var payloadableComponent: PayloadableComponent { get }
}


//
// MARK: - class PayloadableComponent -
//

public struct PayloadableComponent
{
    public typealias Key = String

    private var incomingQueue       = Queue<(Key, IPayloadType)>()
    private var activeTimedPayloads = Controller<String, TimedPayloadMetadata>()
    private var updateTimer         = UpdateTimer()


    public init()
    {
        activeTimedPayloads.childDidMoveToController    = { $0.payload.didMoveToComponent()    }
        activeTimedPayloads.childWillMoveFromController = { $0.payload.willMoveFromComponent() }
    }


    //
    // MARK: - Public interface
    //

    mutating
    public func addPayload <N: SKNode> (payload: IPayloadType, withKey key:Key) {
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
        activeTimedPayloads = activeTimedPayloads |> mapFilter { key, metadata in
                                                         var updatedEntry = metadata
                                                         updatedEntry.remaining -= timeSinceLastUpdate

                                                         if updatedEntry.remaining > 0 {
                                                             updatedEntry.payload.update(currentTime)
                                                             return (key, updatedEntry)
                                                         }
                                                         return nil
                                                     }
    }


    mutating
    private func processIncomingQueue(currentTime:NSTimeInterval)
    {
        while incomingQueue.count > 0
        {
            if var (key, payload) = incomingQueue.dequeue()
            {
                switch payload.type
                {
                    // run instantaneous Payloads once and discard them immediately
                    case .Momentary:
                        payload.update(currentTime)


                    // hold onto timed Payloads while they're Payload-ing
                    case .Timed:
                        let tuple = (NSUUID().UUIDString, TimedPayloadMetadata(payload:payload))
                        activeTimedPayloads.append(tuple)
                }
            }
        }
    }


    //
    // MARK: - Private payload wrapper struct
    //

    private struct TimedPayloadMetadata
    {
        var remaining: NSTimeInterval
        var payload:    IPayloadType

        private init(payload p:IPayloadType) {
            payload = p
            remaining = payload.duration
        }
    }
}








