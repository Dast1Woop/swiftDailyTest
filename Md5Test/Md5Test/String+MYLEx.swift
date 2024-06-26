//
//  String+MYLEx.swift
//  Md5Test
//
//  Created by LongMa on 2024/4/29.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

extension String {
    
    func toMD5HexStr() -> String {
        let md5Data = toMD5Data()
        
        //02hhx:will just be a hexadecimal value with 2 digits.
        let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
        return md5Hex
    }
    
    func toMd5ThenBase64() -> String {
        let md5Data = toMD5Data()
        let md5Base64 =  md5Data.base64EncodedString()
        return md5Base64
    }
  

    func toMD5Data() -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = self.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }

}



