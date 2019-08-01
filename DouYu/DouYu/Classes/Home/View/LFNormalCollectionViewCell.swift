//
//  LFNormalCollectionViewCell.swift
//  DouYu
//
//  Created by cailufei on 2019/8/1.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class LFNormalCollectionViewCell: UICollectionViewCell {
    //MARK:- 属性
    ///图片
    @IBOutlet weak var topImageView: UIImageView!
    ///昵称
    @IBOutlet weak var nameLabel: UILabel!
    ///在线人数
    @IBOutlet weak var countButton: UIButton!
    ///简介
    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
