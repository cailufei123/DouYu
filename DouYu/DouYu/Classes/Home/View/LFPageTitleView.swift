//
//  LFPageTitleView.swift
//  DouYu
//
//  Created by cailufei on 2019/7/23.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit




protocol LFPageTitleViewDelegate : class {
    func pageTitleView(pageTitleView : LFPageTitleView ,selectIndex index : Int)
}



class LFPageTitleView: UIView {
    
    let scrollViewLineH : CGFloat = 2.0
    let bottomLineH : CGFloat = 0.5
    let kNormalColor : (CGFloat,CGFloat,CGFloat) = (85,85,85)
    let kSelectedColor : (CGFloat,CGFloat,CGFloat) = (255,128,0)
    var titleArr : [String] = []
    var currentIndex : Int = 0
    weak var delegate : LFPageTitleViewDelegate?
    
    
    private lazy var scrollView : UIScrollView = {
   
         let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.scrollsToTop = false
        
        return scrollView
    }()
    
     //底部线
    private lazy var scrollViewLine : UIView = {
      let scrollViewLine = UIView()
        scrollViewLine.backgroundColor = UIColor.orange
        return scrollViewLine

    }()
     //存放label的数组
    private lazy var titleLables : [UILabel] =  [UILabel]()
    
    init(frame : CGRect ,titles:[String]) {
        titleArr = titles
        super.init(frame: frame)
        //初始scrollView
        setUpScrollView()
        setUpLabel()
        //添加底部线
        setUpScollViewBottomLineAndSpaceLine()
        
    }
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}



extension LFPageTitleView{
    
    func setUpScrollView(){
        scrollView.frame = bounds
        self.addSubview(scrollView)
    }
    
    //初始化label
    private func setUpLabel(){
        let titleLabelW : CGFloat = frame.width/CGFloat(titleArr.count)
        let titleLabelH : CGFloat = frame.height - CGFloat(scrollViewLineH)
        let titleLabelY : CGFloat = 0
        for (index,title) in titleArr.enumerated() {
            let lable = UILabel()
            lable.text = title
            lable.textAlignment = .center
            lable.tag = index
            let titleLabelX = CGFloat(index) * titleLabelW
            lable.font = UIFont.systemFont(ofSize: 16)
            lable.textColor = UIColor.lightGray
            lable.frame = CGRect(x: titleLabelX, y: titleLabelY, width: titleLabelW, height: titleLabelH)
            scrollView.addSubview(lable)
            //把label添加到数组中
            titleLables.append(lable)
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapPageTitleLabel(tap:)))
            lable.addGestureRecognizer(tap)
            lable.isUserInteractionEnabled = true
        }
       
        
    }
    
    @objc func tapPageTitleLabel(tap:UITapGestureRecognizer){
        
       guard let currentLable = tap.view as? UILabel else{
            return
        }
        let oldLable = titleLables[currentIndex]
        currentLable.textColor = UIColor.orange
        oldLable.textColor = UIColor.lightGray
        currentIndex = currentLable.tag
        let scrollViewLineX =  CGFloat(currentIndex) * scrollViewLine.frame.width
        UIView.animate(withDuration: 0.25) {
            self.scrollViewLine.frame.origin.x = scrollViewLineX
        }
        
        delegate?.pageTitleView(pageTitleView: self, selectIndex: currentIndex)
        
    }
    
      //初始化线
    private func setUpScollViewBottomLineAndSpaceLine(){
        let bottomLine = UIView()
        let bottomY = frame.height - bottomLineH
        bottomLine.frame = CGRect(x:0.0 , y: bottomY, width: kScreenW, height: bottomLineH)
        bottomLine.backgroundColor = UIColor.lightGray
        scrollView .addSubview(bottomLine)
        
        guard  let firstLable = titleLables.first else{
            return
        }
     firstLable.textColor = UIColor.orange
        let scrollViewLineX = firstLable.frame.origin.x
        let scrollViewLineyY = frame.height - scrollViewLineH
        let scrollViewLineyW = firstLable.frame.width
        scrollViewLine.backgroundColor = UIColor.orange
        scrollViewLine.frame = CGRect(x: scrollViewLineX, y: scrollViewLineyY, width: scrollViewLineyW, height: scrollViewLineH)
        scrollView.addSubview(scrollViewLine)
        
        
        
        
        
        
    }
}
extension LFPageTitleView{
    
    func setTitleProgress(progress: CGFloat,sourceIndex: Int,targetIndex: Int) {
          //取出sourceLabel/targetLabel
        let sourceLabel = titleLables[sourceIndex]
        let targetLabel = titleLables[targetIndex]
          //滚动的总位置 -
        let moveTotalX = targetLabel.frame.origin.x -  sourceLabel.frame.origin.x
        
           let moveX = moveTotalX * progress
        
        //颜色的渐变(复杂)
        //取出变化的范围
        let colorDelta = (kSelectedColor.0 - kNormalColor.0,kSelectedColor.1 - kNormalColor.1,kSelectedColor.2 - kNormalColor.2)
        
        //变化sourceLabel字体颜色
        sourceLabel.textColor = UIColor(r: kSelectedColor.0 - colorDelta.0 * progress, g: kSelectedColor.1 - colorDelta.1 * progress, b: kSelectedColor.2 - colorDelta.2 * progress)
        //变化targetLabel字体颜色
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        
         //记录最新的index
        scrollViewLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        currentIndex = targetIndex
    }
}
