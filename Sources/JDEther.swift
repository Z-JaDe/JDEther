//
//  JDEther.swift
//  JDEther
//
//  Created by 郑军铎 on 2018/10/22.
//  Copyright © 2018 zjade. All rights reserved.
//

import Foundation
import ethers

public class JDEther {
    public static func create() -> Account {
        return Account.randomMnemonic()
    }
    public static func `import`(mnemonics: String) -> Account? {
        return Account(mnemonicPhrase: mnemonics)
    }
    public static func `import`(privateKey: Data) -> Account? {
        return Account(privateKey: privateKey)
    }
    public static func `import`(keyStore: String, pwd: String, callback: @escaping (Account?, Error?) -> Void) -> Cancellable {
        return Account.decryptSecretStorageJSON(keyStore, password: pwd, callback: callback)
    }
    // MARK: - 
    public static func isValid(mnemonicWord: String) -> Bool {
        return Account.isValidMnemonicWord(mnemonicWord)
    }
    public static func isValid(mnemonicPhrase: String) -> Bool {
        return Account.isValidMnemonicPhrase(mnemonicPhrase)
    }

    // MARK: -
    public static func hexString(with data: Data) -> String {
        return SecureData.data(toHexString: data)
    }
    public static func data(with hexString: String) -> Data {
        return SecureData.hexString(toData: hexString)
    }

    // MARK: -
    public static func transaction() -> Transaction {
        return Transaction()
    }
}
