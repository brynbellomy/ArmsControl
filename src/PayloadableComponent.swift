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

    private var activeTimedPayloads = Queue<Payload>()
    private var updateTimer         = UpdateTimer()


    public init() {
    }


    //
    // MARK: - Public interface
    //

    mutating
    public func addPayload (payload: Payload) {
        activeTimedPayloads.enqueue(payload)
    }


    mutating
    public func update(currentTime:NSTimeInterval)
    {
        let timeSinceLastUpdate = updateTimer.timeSinceLastUpdate
        updateTimer.update(currentTime)

        processActiveTimedPayloads(currentTime, timeSinceLastUpdate:timeSinceLastUpdate)
    }


    //
    // MARK: - Private helper methods
    //

    mutating
    private func processActiveTimedPayloads(currentTime:NSTimeInterval, timeSinceLastUpdate:NSTimeInterval)
    {
        // using 'map' here because the payload.execute() method is potentially mutating
        activeTimedPayloads = activeTimedPayloads
                                |> map‡ { child in
                                    var payload = child
                                    payload.execute(timeSinceLastUpdate)
                                    return payload
                                }
                                |> selectWhere { payload in payload.remaining > 0 }
    }
}








