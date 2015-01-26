//
//  Payload.swift
//  illumntr-the-game
//
//  Created by bryn austin bellomy on 2015 Jan 8.
//  Copyright (c) 2015 bryn austin bellomy. All rights reserved.
//

import Foundation
import SpriteKit


public protocol IPayloadType
{
    var type: PayloadDurationType { get }
    var duration: NSTimeInterval { get }

    func didMoveToComponent()
    func willMoveFromComponent()
    mutating func update(currentTime:NSTimeInterval)
}


public enum PayloadDurationType
{
    case Momentary
    case Timed
}


public enum PayloadTargetType
{
    case None
    case SingleNode
    case AreaEffect
    case AllNodes
}


public class Payload <N: SKNode>
{
    public typealias DurationType = PayloadDurationType
    public typealias   TargetType = PayloadTargetType

    public let durationType: DurationType   = .Momentary
    public let targetType:   TargetType     = .None
    public var duration:     NSTimeInterval = 0

    private var position = CGPointZero


    public init(durationType d:DurationType, targetType t:TargetType)
    {
        durationType = d
        targetType = t
    }

    public func didMoveToComponent() {

    }

    public func willMoveFromComponent() {

    }

    public func update(currentTime:NSTimeInterval, inout targets:[N]) {
    }
}






