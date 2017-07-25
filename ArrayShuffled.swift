//
//  ArrayShuffled.swift
//  Quiz
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 net.nana.ichikawa. All rights reserved.
//

import Foundation

extension Array {
    
    func shuffled() -> [Element] {
        var results = [Element]()
        var indexes = (0 ..< count).map { $0 }
        while indexes.count > 0 {
            let indexOfIndexes = Int(arc4random_uniform(UInt32(indexes.count)))
            let index = indexes[indexOfIndexes]
            results.append(self[index])
            indexes.remove(at: indexOfIndexes)
        }
        return results
    }
    
}
