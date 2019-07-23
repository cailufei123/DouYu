//
//  LFHomeViewController.swift
//  DouYu
//
//  Created by cailufei on 2019/7/22.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
//import FSCalendar
let kPageTitleViewH : CGFloat = 40

class LFHomeViewController: UIViewController {
    private  lazy var chilVcs : [UIViewController]  = [UIViewController]()
    private lazy var  pageTitleView : LFPageTitleView = {[weak self] in
       
         let titleViewFrame = CGRect(x: 0, y: kNavgationBarH, width: kScreenW, height: kPageTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let pageTitleView = LFPageTitleView(frame: titleViewFrame, titles: titles)
        pageTitleView.delegate = self
        pageTitleView.backgroundColor = UIColor.white
      return pageTitleView
    }()
  
    private lazy var pageContentView : LFPageContentView = {[weak self] in
        let pageContentViewY : CGFloat = kNavgationBarH + kPageTitleViewH
        let pageContentViewH : CGFloat = kScreenH - kNavgationBarH - kTabBarH - kPageTitleViewH
        chilVcs.append(LFRecommendController())
        for _ in 0..<3{
        let childVc = UIViewController()
        childVc.view.backgroundColor = UIColor(r:CGFloat(arc4random_uniform(250)), g: CGFloat(arc4random_uniform(250)), b: CGFloat(arc4random_uniform(250)))
          chilVcs.append(childVc)
        }
      
    let pageContentView = LFPageContentView(frame: CGRect(x: 0, y: pageContentViewY, width: kScreenW, height: pageContentViewH), childVcs: chilVcs, parentViewController: self)
     pageContentView.delegate = self
    return pageContentView
    }()
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

          setUI()
       
    }
    

}
extension LFHomeViewController: LFPageTitleViewDelegate,LFPageContentViewDelegate{
  
    
  
    func setUI() {
        //初始化导航栏
        setUpNavgationBar()
         //初始化栏目
        setUpPageTitleView()
        //初始化内容view
        setUpPageContentView()
        view.backgroundColor = UIColor.white
        navigationItem.title = "首页"
    }
    ///初始化导航栏
    private func setUpNavgationBar(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
          //设置导航栏右边按钮
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", heighImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", heighImageName: "btn_search_clicked", size: size)
        let qrcordItem = UIBarButtonItem(imageName: "Image_scan", heighImageName: "Image_scan_click", size: size)
        self.navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcordItem]
    }
    //初始化栏目
    private func setUpPageTitleView(){
        self.view.addSubview(pageTitleView)
    }
    //初始化内容view
    private func setUpPageContentView(){
        self.view.addSubview(pageContentView)
    }
    
    func pageTitleView(pageTitleView: LFPageTitleView, selectIndex index: Int) {
        pageContentView.currentContentView(currentIndex: index)
    }
    
    func pageContentView(pageContenView: LFPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    
}

