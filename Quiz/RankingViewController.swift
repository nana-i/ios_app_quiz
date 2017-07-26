//
//  RankingViewController.swift
//  Quiz
//
//  Created by nttr on 2017/07/26.
//  Copyright © 2017年 net.nana.ichikawa. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var quizTableView: UITableView!
    
    // データを宣言
    var quizResults = [["date": "2017/7/26 10:01:23",
                        "result": "5問中5問正解"],
                       ["date": "2017/7/26 10:45:08",
                        "result": "5問中4問正解"],
                       ["date": "2017/7/26 10:00:00",
                        "result": "5問中2問正解"],]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quizTableView.dataSource = self
        quizTableView.delegate = self
        
        // TableViewの不要な線を消す
        quizTableView.tableFooterView = UIView()
        
        // カスタムセルの登録
        let nib = UINib(nibName: "QuizTableViewCell", bundle: Bundle.main)
        quizTableView.register(nib, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 「Cell」というidで再利用可能なcellの取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! QuizTableViewCell
        
        cell.quizDateLabel.text = quizResults[indexPath.row]["date"]
        cell.quizResultLabel.text = quizResults[indexPath.row]["result"]
        
        return cell
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
