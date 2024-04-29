//
//  Data+MYLEx.swift
//  Md5Test
//
//  Created by LongMa on 2024/4/29.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

extension Data {
    
    /**字节数组转为Data示例：
     var dataArr = [UInt8].init(repeating: 0, count: 38)
     let data = Data(dataArr)
     data转md5示例：let md5Data = data.toMd5Data()
     */
    func toMd5Data()->Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            self.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(self.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    
    func toMD5HexStr() -> String {
        
        //02hhx:will just be a hexadecimal value with 2 digits.
        let md5Hex =  self.map { String(format: "%02hhx", $0) }.joined()
        return md5Hex
    }
}
