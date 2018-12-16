//
//  CK550CommandStars.swift
//  ck550-cli
//
//  Created by Michal Duda on 02/12/2018.
//  Copyright © 2018 Michal Duda. All rights reserved.
//

import Foundation

extension CK550Command {

    private struct OffEffectStarsSpeedBytes {
        static func bytes(speed: OffEffectStarsSpeed) -> [uint8] {
            switch speed {
            case .Lowest:
                return [0x17, 0x01]
            case .Lower:
                return [0x0E, 0x01]
            case .Middle:
                return [0x08, 0x01]
            case .Higher:
                return [0x0A, 0x02]
            case .Highest:
                return [0x0A, 0x04]
            }
        }
    }

    enum OffEffectStarsSpeed: uint8 {
        typealias RawValue = uint8
        case Lowest = 0x00
        case Lower = 0x01
        case Middle = 0x02
        case Higher = 0x03
        case Highest = 0x04
    }

    static var setOffEffectStarsUNKNOWN_BEFORE_PACKETS: [uint8] {
        get {
            return newCommand(request: [0x56, 0x81, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        }
    }

    static func setOffEffectStars(background: RGBColor, key: RGBColor, speed: OffEffectStarsSpeed) -> [[uint8]] {
        var result: [[uint8]] = [
            [0x56, 0x83, 0x00, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x03, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0xC1, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0x0C, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x80, 0x0A, 0x10, 0x00, 0x00, 0xFE, 0xFD, 0xFC, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x01, 0x10, 0x08, 0x01, 0x10, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],

            [0x56, 0x83, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        ]

        result[0][24] = UInt8(background.red)
        result[0][25] = UInt8(background.green)
        result[0][26] = UInt8(background.blue)

        result[0][40] = UInt8(key.red)
        result[0][41] = UInt8(key.green)
        result[0][42] = UInt8(key.blue)

        let bytes = OffEffectStarsSpeedBytes.bytes(speed: speed)
        result[0][36] = bytes[0]
        result[0][46] = bytes[1]

        return result
    }
}
