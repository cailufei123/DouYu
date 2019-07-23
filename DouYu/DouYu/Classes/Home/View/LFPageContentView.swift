//
//  LFPageContentView.swift
//  DouYu
//
//  Created by cailufei on 2019/7/23.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
private let contentViewCellID = "contentViewCellID"

protocol LFPageContentViewDelegate : class  {
    func pageContentView(pageContenView: LFPageContentView,progress: CGFloat,sourceIndex: Int,targetIndex: Int)
}
class LFPageContentView: UIView {
  //MARK:-属性
    private var childVcs : [UIViewController] = [UIViewController]()
    private weak var parentViewController : UIViewController?
    weak var delegate : LFPageContentViewDelegate?
    private var startOffsetX : CGFloat  = 0
    private var isForbidScrollDelegate:Bool  = false
    
     //MARK:-懒加载 UICollectionView
    private lazy var collectionView : UICollectionView = {
      
        
        
        let followLyout = UICollectionViewFlowLayout()
        followLyout.minimumLineSpacing = 0
        followLyout.minimumInteritemSpacing = 0
        followLyout.itemSize = bounds.size
        followLyout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: followLyout)
        collectionView.backgroundColor = UIColor.red
        collectionView.scrollsToTop = false
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
       collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: contentViewCellID)
        return collectionView
        
    }()
    
    init(frame:CGRect,childVcs:[UIViewController],parentViewController:UIViewController?) {
        super.init(frame: frame)
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        //初始化UI
        setUpUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LFPageContentView:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  collectioCell = collectionView.dequeueReusableCell(withReuseIdentifier: contentViewCellID, for: indexPath)
        for childView in collectioCell.contentView.subviews {
            childView.removeFromSuperview()
        }
          //添加子控制器的view到cell上
        let childVc = childVcs[indexPath.item]
//        childVc.view.frame =  collectioCell.contentView.bounds
//         childVc.view.backgroundColor = UIColor.orange
        childVc.view.frame = collectioCell.contentView.bounds
      
        
       collectioCell.contentView.addSubview(childVc.view)
        
        return collectioCell
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isForbidScrollDelegate = false
         //开始位置偏移量
        startOffsetX = scrollView.contentOffset.x
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isForbidScrollDelegate == true {
            return
        }
        var progress : CGFloat = 0
         //记录之前的label下标
        var sourceIndex : Int  = 0
         //记录当前的label下标
        var targetIndex  : Int  = 0
        
          let currentOffsetX = scrollView.contentOffset.x
          let scrollViewW : CGFloat = scrollView.frame.width
        if currentOffsetX > startOffsetX {  //左滑
           progress = (currentOffsetX/scrollViewW) - floor(currentOffsetX/scrollViewW)
               //计算sourceIndex
            sourceIndex = Int(currentOffsetX/scrollViewW)
            targetIndex = sourceIndex + 1
            if(targetIndex >= childVcs.count){
                  targetIndex = childVcs.count - 1
            }
              //滚动完成(完全划过去)
            if currentOffsetX - startOffsetX  == scrollViewW{
                progress = 1
                targetIndex = sourceIndex
            }
        }else{
            //滑动比例
            progress = 1 - ((currentOffsetX / scrollViewW) - floor(currentOffsetX / scrollViewW))
            
            //计算targetIndex
            targetIndex = Int(currentOffsetX / scrollViewW)
            //计算sourceIndex
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count{
                sourceIndex = childVcs.count - 1
            }
        }
        
        
        delegate?.pageContentView(pageContenView: self, progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    
}

extension LFPageContentView{
    func setUpUI()  {
     
        for childVc in childVcs {
        parentViewController?.addChild(childVc)
        }
        //添加collectionview，用于在cell中子控制器的view
        self.addSubview(collectionView)
        collectionView.frame = self.bounds
    }
     //将所有子控制器添加到父控制器中
 
}

extension LFPageContentView{
    func currentContentView(currentIndex : Int) {
        isForbidScrollDelegate = true
        let offsetX =  self.frame.width * CGFloat(currentIndex)
        
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}


