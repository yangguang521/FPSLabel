//
//  ViewController.swift
//  FPSLabel
//
//  Created by zzqq on 2018/5/16.
//  Copyright © 2018年 yangguang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListCell.self, forCellReuseIdentifier: "cellIdentifer")
        view.addSubview(tableView)
        let fpsLabel = FPSLabel.init(frame: CGRect(x: 10, y: UIScreen.main.bounds.height/2, width: 60, height: 20))
        view.addSubview(fpsLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifer") as! ListCell
        return cell
    }
    
    
}

