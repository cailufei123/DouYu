//
//  LFPrettyCollectionViewCell.swift
//  DouYu
//
//  Created by cailufei on 2019/8/1.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
import Kingfisher
class LFPrettyCollectionViewCell: LFCollectionBaseCell {

   
    // MARK:- 控件属性
    @IBOutlet weak var cityBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    var prettypModel : LFAnchorModel? {
        didSet{
          super.anchor = prettypModel
            // 2.所在的城市
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
        }
    }
    
    
}
