//
//  LFCollectionReusableView.swift
//  DouYu
//
//  Created by cailufei on 2019/8/1.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class LFCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var achorGroupModel : LFAnchorGroup? {
        didSet{
//            guard  let achorGroup = achorGroupModel else {
//                return
//            }
           let url = URL(string: achorGroupModel?.icon_name ?? "home_header_normal")
            
            icon.kf.setImage(with: url)
           title.text = achorGroupModel?.tag_name

           icon.image = UIImage(named: achorGroupModel?.icon_name ?? "home_header_normal")
        }
    }
    @IBAction func moreAction(_ sender: Any) {
        
        
    }
}
