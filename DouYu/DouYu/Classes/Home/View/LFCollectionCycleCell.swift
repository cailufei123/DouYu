//
//  LFCollectionCycleCell.swift
//  DouYu
//
//  Created by cailufei on 2019/8/7.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class LFCollectionCycleCell: UICollectionViewCell {
    // MARK: 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: 定义模型属性
    var cycleModel : CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            let iconURL = URL(string: cycleModel?.pic_url ?? "")!
            iconImageView.kf.setImage(with: iconURL, placeholder: UIImage(named: "Img_default"))
        }
    }
}
