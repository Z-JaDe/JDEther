//
//  ViewController.swift
//  JDEther
//
//  Created by 郑军铎 on 2018/10/18.
//  Copyright © 2018 zjade. All rights reserved.
//

import UIKit
import ethers
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let account = JDEther.import(privateKey: SecureData.hexString(toData: "0x1914a858bd8866517c5aebf47093d42bb6a2559d41e85c456d104328df0b8568"))!

        let transaction = JDEther.transaction()
        transaction.value = ETH(0).wei.formatNumber
        transaction.gasLimit = BigNumber(integer: 21000)
        transaction.gasPrice = ETH(0).wei.formatNumber.div(transaction.gasLimit)
        transaction.nonce = 9
        transaction.toAddress = Address(string: "0xCdEA8943929EaeD6cEB9F53350a2565652539e41")


        let data: SecureData = SecureData.init(capacity: 68)
        data.appendData(SecureData.hexString(toData: "0xa9059cbb"))

//        let dataAddress: Data = transaction.toAddress!.data
//        (0..<(32 - dataAddress.count)).forEach { (_) in
//            data.appendByte(0)
//        }
//        data.appendData(dataAddress)
//        let valueData: Data = transaction.value.data
//        (0..<(32 - valueData.count)).forEach { (_) in
//            data.appendByte(0)
//        }
//        data.appendData(valueData)
//
//        transaction.value = BigNumber.constantZero()
        transaction.data = SecureData.hexString(toData: "0x11")

        account.sign(transaction)
        let provider = EtherscanProvider(chainId: .ChainIdKovan)
        provider?.getTransactionCount(account.address)?.onCompletion({ (hash) in
            transaction.nonce = UInt(hash?.value ?? 0)

            provider?.getBalance(transaction.toAddress)?.onCompletion({ (hash) in
                hash?.error
            })
            provider!.sendTransaction(transaction.serialize())!.onCompletion({ (hash) in
                hash?.value
            })
        })
    }




}

