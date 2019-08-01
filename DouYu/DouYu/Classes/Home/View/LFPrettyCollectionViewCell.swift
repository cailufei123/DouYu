//
//  LFPrettyCollectionViewCell.swift
//  DouYu
//
//  Created by cailufei on 2019/8/1.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class LFPrettyCollectionViewCell: UICollectionViewCell {

   
    //MARK:-属性
    ///图片
    @IBOutlet weak var topImageView: UIImageView!
    ///在线人数
    @IBOutlet weak var countLabel: UILabel!
    ///标题
    @IBOutlet weak var titleLabel: UILabel!
    ///位置按钮
    @IBOutlet weak var locationButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.topImageView.layer.cornerRadius = 5
        self.titleLabel.layer.cornerRadius = 5
    }

}
