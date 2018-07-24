//
//  ListCell.swift
//  FPSLabel
//
//  Created by xgqq on 2018/7/24.
//  Copyright © 2018年 yangguang521. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    fileprivate func setUpView() {
        let label = UILabel(frame: CGRect.init(x: 10, y: 10, width: 40, height: 20))
        label.text = "label"
        contentView.addSubview(label)
    }
    
    func printCell() {
        print("\(self)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
