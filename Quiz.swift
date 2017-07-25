//
//  Quiz.swift
//  Quiz
//
//  Created by nttr on 2017/07/25.
//  Copyright © 2017年 net.nana.ichikawa. All rights reserved.
//

import UIKit

class Quiz: NSObject {
    
    // 正解の都道府県コード
    var ansPrefCode:Int!
    
    // 不正解の都道府県コード
    var wrongAnsPrefCode1:Int!
    var wrongAnsPrefCode2:Int!
    var wrongAnsPrefCode3:Int!
    
    // 正解・不正解の都道府県コードをシャッフルした配列
    var shuffledPrefCodeArr: [Int]!
    
    // 使用する都道府県コードを決める
    func setPrefCodes() {
        // 47都道府県から正解を1つ乱数で決める
        ansPrefCode = Int(arc4random_uniform(46)) + 1
        
        // 正解以外の選択肢を決める
        // 不正解1
        repeat {
            wrongAnsPrefCode1 = Int(arc4random_uniform(46)) + 1
        } while wrongAnsPrefCode1 == ansPrefCode
        
        // 不正解2
        repeat {
            wrongAnsPrefCode2 = Int(arc4random_uniform(46)) + 1
        } while wrongAnsPrefCode2 == ansPrefCode
            && wrongAnsPrefCode2 == wrongAnsPrefCode1
        
        // 不正解3
        repeat {
            wrongAnsPrefCode3 = Int(arc4random_uniform(46)) + 1
        } while wrongAnsPrefCode3 == ansPrefCode
            && wrongAnsPrefCode3 == wrongAnsPrefCode1
            && wrongAnsPrefCode3 == wrongAnsPrefCode2

        // 正解・不正解の都道府県コードをシャッフルする
        shuffledPrefCodeArr = [ansPrefCode, wrongAnsPrefCode1, wrongAnsPrefCode2, wrongAnsPrefCode3]
        shuffledPrefCodeArr = shuffledPrefCodeArr.shuffled()
    }

}
