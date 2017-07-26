//
//  ViewController.swift
//  Quiz
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 net.nana.ichikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var prefArr: [String]!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var label: UILabel!
    
    var quiz: Quiz!
    
    // 質問の通し番号
    var questionNum:Int = 0

    // 質問最大数
    let maxQuestionNum = 5

    // 正解数
    var correctedQuestionNum:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 都道府県データを取得
        prefArr = getPrefArrFromCsv()
        
        // quizオブジェクトを生成し、都道府県問題を作成
        quiz = Quiz()
        
        // 問題の更新
        updateQuiz()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapButton1() {
        if (button1.tag == quiz.ansPrefCode) {
            correctedQuestionNum = correctedQuestionNum + 1
            showCorrectAlert()
        } else {
            showFailureAlert()
        }
    }
    
    @IBAction func tapButton2() {
        if (button2.tag == quiz.ansPrefCode) {
            correctedQuestionNum = correctedQuestionNum + 1
            showCorrectAlert()
        } else {
            showFailureAlert()
        }
    }
    
    @IBAction func tapButton3() {
        if (button3.tag == quiz.ansPrefCode) {
            correctedQuestionNum = correctedQuestionNum + 1
            showCorrectAlert()
        } else {
            showFailureAlert()
        }
    }
    
    @IBAction func tapButton4() {
        if (button4.tag == quiz.ansPrefCode) {
            correctedQuestionNum = correctedQuestionNum + 1
            showCorrectAlert()
        } else {
            showFailureAlert()
        }
    }
    
    // クイズの更新
    func updateQuiz() {
        // 最大数チェック
        if questionNum >= maxQuestionNum {
            
//            let ud = UserDefaults.standard
//            
//            // userDefaultsに保存する文
//            var result = getNowClockString() + String(maxQuestionNum) + "問中" + String(correctedQuestionNum) + "問正解"
//            
//            // 一度でもuserDefaultsに保存していたら
//            if ud.array(forKey: "resultArray") != nil {
//                var saveResultArray = ud.array(forKey: "resultArray") as! [String]
//                saveResultArray.append(result)
//                ud.set(saveResultArray, forKey: "resultArray")
//                
//            // userDefaultsのデータがない場合は新規追加
//            } else {
//                var saveResultArray:[String] = [result]
//                ud.set(saveResultArray, forKey: "resultArray")
//                ud.set(saveResultArray, forKey: "memoArray")
//            }
//            ud.synchronize()
            
            // 初期化
            questionNum = 0
            correctedQuestionNum = 0
            
            // ランキング画面へ
            self.performSegue(withIdentifier: "toDetail", sender: nil)
        }
        questionNum = questionNum + 1
        
        // TODO initメソッドを使ったほうがよさげ
        quiz.setPrefCodes()
        
        // 各UIオブジェクトにセット
        label.text = String(maxQuestionNum) + "問中" + String(questionNum) + "問目"
        
        imageView.image = UIImage(named: String(format: "%02d", quiz.ansPrefCode) + ".png")
        button1.tag = quiz.shuffledPrefCodeArr[0]
        // 配列が0から始まるため、都道府県コードに合わせてデクリメントする必要がある。イケてない。。
        button1.setTitle(prefArr[quiz.shuffledPrefCodeArr[0] - 1], for: .normal)
        
        button2.tag = quiz.shuffledPrefCodeArr[1]
        button2.setTitle(prefArr[quiz.shuffledPrefCodeArr[1] - 1], for: .normal)
        
        button3.tag = quiz.shuffledPrefCodeArr[2]
        button3.setTitle(prefArr[quiz.shuffledPrefCodeArr[2] - 1], for: .normal)
        
        button4.tag = quiz.shuffledPrefCodeArr[3]
        button4.setTitle(prefArr[quiz.shuffledPrefCodeArr[3] - 1], for: .normal)
        
    }
    
    // 都道府県csvをString配列に変換
    func getPrefArrFromCsv() -> [String] {
        var csvArr: [String] = []
        if let csvPath = Bundle.main.path(forResource: "pref", ofType: "csv") {
            do {
                let csvStr = try String(contentsOfFile: csvPath, encoding: String.Encoding.utf8)
                // 改行コードで区切って配列に変換
                csvArr = csvStr.components(separatedBy: .newlines)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return csvArr
    }
    
    // 正解のアラート
    func showCorrectAlert() {
        var message:String = "正解です！"
        if questionNum == maxQuestionNum {
            message = "\n\n" + String(maxQuestionNum) + "問中"
                + String(correctedQuestionNum) + "問正解しました。"
        }
        let alert = UIAlertController(title: "正解！", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) in
            self.updateQuiz()
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 失敗のアラート
    func showFailureAlert() {
        var message:String = "正解は" + prefArr[quiz.ansPrefCode - 1] + "です。"
        if questionNum == maxQuestionNum {
            message = "\n\n" + String(maxQuestionNum) + "問中"
                + String(correctedQuestionNum) + "問正解しました。"
        }

        let alert = UIAlertController(title: "不正解", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) in
            self.updateQuiz()
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func getNowClockString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd' 'HH:mm:ss"
        let now = Date()
        return formatter.string(from: now)
    }
}

