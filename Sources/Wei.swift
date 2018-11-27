//
//  Wei.swift
//  JDEther
//
//  Created by 郑军铎 on 2018/11/15.
//  Copyright © 2018 zjade. All rights reserved.
//

import Foundation
import ethers

public struct Wei {
    public typealias ValueType = BigNumber
    let value: ValueType
    public init(_ value: ValueType) {
        self.value = value
    }
    public init(_ eth: ETH) {
        /// ZJaDe: 先把 eth的值转换成一个相对大的Int值，然后转换成BigNumber，在乘以ETH转换到Wei的剩余倍数(10的18次方 除 10的n次方)
        let powerN = pow(10, Double(eth.effectiveDigits))
        let intValue: Int64 = Int64(eth.value * powerN)
        let value = ValueType(decimalString: "\(intValue)")!
        self.value = value.mul(BigNumber.constantWeiPerEther()!.div(BigNumber(integer: Int(powerN))))
    }
    
    public var formatNumber: ValueType {
        return self.value
    }
}
