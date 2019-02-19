//
//  Account.swift
//  JDEther
//
//  Created by 郑军铎 on 2018/10/23.
//  Copyright © 2018 zjade. All rights reserved.
//

import Foundation
import ethers

extension Account {
    public var privateKeyHexString: String {
        return JDEther.hexString(with: self.privateKey)
    }
    public var mnemonicPhraseArr: [String] {
        return mnemonicPhrase.lazy.split(separator: " ").map(String.init)
    }
}
