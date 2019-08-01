//
//  LFRecommendController.swift
//  DouYu
//
//  Created by cailufei on 2019/7/23.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
import Alamofire
let itemMargn : CGFloat = 10.0
let itemW = (kScreenW - CGFloat(3 * itemMargn))/2
let itemNorH = itemW * 3 / 4


private let kNormalCellH : CGFloat = itemW * 3 / 4
private let kPrettyCellH : CGFloat = (itemW * 4) / 3

//设置组头高度
private let kCollectionViewHeaderH : CGFloat = 50
private let kCollectionViewHeaderID = "kCollectionViewHeaderID"
let  normalCollectionCellID = "normalCollectionCellID"

let  prettyCollectionViewCellID = "prettyCollectionViewCellID"


class LFRecommendController: UIViewController {
   //MARK - 懒加载
    private lazy var colloctionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: itemW, height: itemH)
        flowLayout.minimumLineSpacing = 0
     flowLayout.headerReferenceSize =  CGSize(width: kScreenW, height: kCollectionViewHeaderH)
        //列间距(最小间距)
        flowLayout.minimumInteritemSpacing = itemMargn
         //设置每个分区的EdgeInset，这个属性可以设置分区的偏移量
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: itemMargn, bottom: 0, right: itemMargn)
        let colloctionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        colloctionView.showsVerticalScrollIndicator = true
        colloctionView.delegate = self
        colloctionView.dataSource = self
        colloctionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: normalCollectionCellID)
        colloctionView.register(UINib(nibName: "LFNormalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: normalCollectionCellID)
        colloctionView.register(UINib(nibName: "LFPrettyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: prettyCollectionViewCellID)
          //让子控件根据父控件的宽高进行缩放
        colloctionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        colloctionView.backgroundColor = UIColor.purple
//      colloctionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kCollectionViewHeaderID)
        colloctionView.register(UINib(nibName: "LFCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kCollectionViewHeaderID)
        
        
       return colloctionView
    }()
    

    
    
//MARK - 系统方法
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.red
          view.addSubview(colloctionView)
        
//
//        NetWorkTool.requestData(.get, urlString:  "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : NSDate.getCurrentDate()]) { (result) in
//
//        }
//
        
        
        
        
    }
    
  
    
}


extension LFRecommendController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return 8
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell
        
       
        
        if indexPath.section == 1 {
          
            cell = collectionView.dequeueReusableCell(withReuseIdentifier:prettyCollectionViewCellID , for: indexPath) as! LFPrettyCollectionViewCell
            cell.backgroundColor = UIColor.green
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier:normalCollectionCellID , for: indexPath) as! LFNormalCollectionViewCell
            cell.backgroundColor = UIColor.green
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kCollectionViewHeaderID, for: indexPath)
        reusableView.backgroundColor = UIColor.orange
       return reusableView
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1{
            return CGSize(width: itemW, height: kPrettyCellH)
        }else{
            return CGSize(width: itemW, height: kNormalCellH)
        }
    }
}
