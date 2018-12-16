//
//  CK550CommandColorCycle.swift
//  ck550-cli
//
//  Created by Michal Duda on 02/12/2018.
//  Copyright © 2018 Michal Duda. All rights reserved.
//

import Foundation

extension CK550Command {

    enum OffEffectColorCycleSpeed: uint8 {
        typealias RawValue = uint8
        case Lowest = 0x10
        case Lower = 0x0C
        case Middle = 0x08
        case Higher = 0x04
        case Highest = 0x00
    }

    static var setOffEffectColorCycleUNKNOWN_BEFORE_PACKETS: [uint8] {
        get {
            return newCommand(request: [0x56, 0x81, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        }
    }

    static func setOffEffectColorCycle(speed: OffEffectColorCycleSpeed) -> [[uint8]] {
        var result: [[uint8]] = [
            [0x56, 0x83, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x31, 0x00, 0xC1, 0x10, 0x00, 0x00, 0x00, 0x40, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        ]

        result[0][12] = speed.rawValue

        return result
    }
}
