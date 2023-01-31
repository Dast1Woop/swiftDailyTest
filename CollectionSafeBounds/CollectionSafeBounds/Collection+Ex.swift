//
//  Collection+Ex.swift
//  CollectionSafeBounds
//
//  Created by LongMa on 2023/1/31.
//

import Foundation

extension Collection {
    subscript(safe index:Index)->Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
