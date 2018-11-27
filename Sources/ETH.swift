//
//  ETH.swift
//  JDEther
//
//  Created by 郑军铎 on 2018/11/15.
//  Copyright © 2018 zjade. All rights reserved.
//

import Foundation
import ethers
public struct ETH {
    public typealias ValueType = Double
    let value: ValueType
    public init(_ value: ValueType) {
        self.value = value
    }
    /// ZJaDe: 小于等于9
    public var effectiveDigits: Int = 8
    public var wei: Wei {
        return Wei(self)
    }
}
extension ETH: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int64) {
        self.init(Double(value))
    }
}
extension ETH: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}
extension ETH: Comparable {
    public static func < (lhs: ETH, rhs: ETH) -> Bool {
        return lhs.value < rhs.value
    }
}
