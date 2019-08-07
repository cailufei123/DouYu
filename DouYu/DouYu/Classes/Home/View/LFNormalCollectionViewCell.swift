//
//  LFNormalCollectionViewCell.swift
//  DouYu
//
//  Created by cailufei on 2019/8/1.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class LFNormalCollectionViewCell: LFCollectionBaseCell {
       // MARK:- 控件的属性
    @IBOutlet weak var roomNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var prettypModel : LFAnchorModel? {
        didSet{
           super.anchor = prettypModel
          
            roomNameLabel.text = prettypModel?.room_name
        }
    }
}
