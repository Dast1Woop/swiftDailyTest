//
//  Envelope.swift
//  DecodeWithKeyPath
//
//  Created by LongMa on 2023/7/31.
//

import Foundation

enum MyError:Error {
    case parseError
}

let kContentId = "contentId"

struct Envelope<Content:Decodable> : Decodable {
    var content:Content?
    
    struct CodingKeys:CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        
        guard let ci = decoder.userInfo[CodingUserInfoKey.init(rawValue: kContentId)!],
              let ciStr = ci as? String,
              let key = CodingKeys.init(stringValue: ciStr)
        else {
            throw MyError.parseError
        }
        
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        content = try? container?.decode(Content.self, forKey: key)
    }
    
}
