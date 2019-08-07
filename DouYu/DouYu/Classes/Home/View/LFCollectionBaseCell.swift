//
//  LFCollectionBaseCell.swift
//  DouYu
//
//  Created by cailufei on 2019/8/7.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class LFCollectionBaseCell: UICollectionViewCell {
    // MARK:- 控件属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    var anchor : LFAnchorModel?{
        didSet{
            guard let anchor = anchor else {
                return
            }
            // 1.取出在线人数显示的文字
            var onlineStr :String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
               onlineBtn.setTitle(onlineStr, for: .normal)
            // 2.昵称的显示
            nickNameLabel.text = anchor.nickname
            guard let url = URL(string: anchor.vertical_src) else {
                return
            }
            
            iconImageView.kf.setImage(with: url)
            
        }
    }
    
}
