//
//  LFRecommendCycleView.swift
//  DouYu
//
//  Created by cailufei on 2019/8/7.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
private let kcycleCellID = "kcycleCellID"
class LFRecommendCycleView: UIView {
    
    var cycleTimer : Timer?
 
    override func awakeFromNib() {
        super.awakeFromNib()
    
     
        // 设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = UIView.AutoresizingMask()
        collocationView.register(UINib(nibName: "LFCollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kcycleCellID)
   
        collocationView.delegate = self
        collocationView.dataSource = self
    }
   
    @IBOutlet weak var collocationView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var cycleModels : [CycleModel]?{
        didSet{
            
            collocationView.reloadData()
            pageControl.numberOfPages = cycleModels?.count ?? 0
            
            let indexPath = NSIndexPath(item: (cycleModels?.count ?? 0) * 10, section: 0)
            
            collocationView.scrollToItem(at: indexPath as IndexPath , at: .left, animated: false)
            // 4.添加定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    override func layoutSubviews() {
        
    super.layoutSubviews()
        // 设置collectionView的layout
        let layout = collocationView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collocationView.bounds.size
       
    }
 
}


// MARK:- 提供快速创建的类方法
extension LFRecommendCycleView {
    class func recommendCycleView() -> LFRecommendCycleView {
        return Bundle.main.loadNibNamed("LFRecommendCycleView", owner: nil, options: nil)?.first as! LFRecommendCycleView
    }
}

//MARK - 代理
extension LFRecommendCycleView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (cycleModels?.count ?? 0) * 10000
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kcycleCellID, for: indexPath) as! LFCollectionCycleCell
        cell.cycleModel = cycleModels![indexPath.item % cycleModels!.count]
        
        return cell
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return collocationView.bounds.size
    }
}
//MARK - 代理
extension LFRecommendCycleView : UICollectionViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 1.获取滚动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width * 0.5
        
        // 2.计算pageControl的currentIndex
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % (cycleModels?.count ?? 1)
    
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
          removeCycleTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}
extension LFRecommendCycleView{
//    cycleTimer = tim
    
    fileprivate func  addCycleTimer() {
        cycleTimer = Timer(timeInterval: 1.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
           RunLoop.main.add(cycleTimer!, forMode: .common)
    }
    fileprivate func removeCycleTimer() {
        cycleTimer?.invalidate() // 从运行循环中移除
        cycleTimer = nil
    }
    fileprivate func reemoveCycleTimer() {
        cycleTimer?.invalidate() // 从运行循环中移除
        cycleTimer = nil
    }
    
    @objc  fileprivate func scrollToNext(){
          // 1.获取滚动的偏移量
        // 1.获取滚动的偏移量
        let currentOffsetX = collocationView.contentOffset.x
        let offsetX = currentOffsetX + collocationView.bounds.width
        
        // 2.滚动该位置
        collocationView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
    }
}
