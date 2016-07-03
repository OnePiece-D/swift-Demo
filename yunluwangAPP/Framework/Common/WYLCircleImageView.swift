//
//  WYLCircleImageView.swift
//  yunluwangAPP
//
//  Created by 王亚龙 on 16/7/2.
//  Copyright © 2016年 WYL. All rights reserved.
//

import UIKit

let timeInter = 3.0

typealias tapImageIndex = (index:Int) -> Void

class WYLCircleImageView: UIView ,UIScrollViewDelegate {

    //用于传值(闭包方式)
    var imageTapIndex :tapImageIndex?
    
    //控件
    lazy var scrollView : UIScrollView = {
        let scrollView :UIScrollView = UIScrollView(frame:self.frame)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.delegate = self
        
        return scrollView
    }()
    lazy var pageView :UIPageControl = {
        let pageControl = UIPageControl(frame:CGRect(x: 0, y: 0, width: 100, height: 30))
        //选中的颜色设置
        pageControl.currentPageIndicatorTintColor = UIColor.orangeColor()
        //未选中的颜色设置
//        pageControl.pageIndicatorTintColor = UIColor.yellowColor()
        
        return pageControl
    }()
    var timer:NSTimer?
    
    var images :[String] = Array()
    var imageViews:[UIImageView] = Array()
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setSubViews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setSubViews()
        //背景色
//        colorTestSubViews()
    }
    
    //convenience 是二等公民,比init级别低
    convenience init(frame: CGRect, images subImages:[String]) {
        self.init(frame:frame)
        images = subImages
        images.insert(subImages.first!, atIndex: subImages.count)
        images.insert(subImages.last!, atIndex: 0)
        setCustomImagesViews()
        print(images,imageViews.count)
    }
    
    func colorTestSubViews() {
        pageView.backgroundColor = UIColor.orangeColor()
        scrollView.backgroundColor = UIColor.orangeColor()
    }
    
    func setSubViews() {
        self.addSubview(scrollView)
        self.addSubview(pageView)
        
        pageView.center = scrollView.center
        pageView.y = scrollView.height - 30
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timeInter, target: self, selector: #selector(WYLCircleImageView.timeRepeat), userInfo: nil, repeats: true)
        timer!.fire()
    }

    func setCustomImagesViews() {
        for i in 0..<images.count {
            //imageView set and imageArr.append
            let name = images[i]
            let imageView = UIImageView()
            imageView.image = UIImage(named:name)
            imageView.clipsToBounds = true
            imageViews.append(imageView)
            //location
            imageView.x = (CGFloat)(i) * SCREEN_WIDTH
            imageView.y = 0
            imageView.width = scrollView.width
            imageView.height = scrollView.height
            //add-To-SuperView
            scrollView.addSubview(imageView)
            scrollView.contentSize = CGSize(width:imageView.x + scrollView.width,height: 0)
            //add-Action
            imageView.userInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(WYLCircleImageView.imageTapAction(_:))))
        }
        scrollView.setContentOffset(CGPoint(x: scrollView.width, y: 0), animated: false)
        pageView.numberOfPages = images.count - 2
    }
    
    /**
     *  tapAction
     */
    func imageTapAction(sender: UITapGestureRecognizer) {
        //as 语法(in语法)
        let imageView = sender.view as! UIImageView
//        print(imageViews.indexOf(imageView)! - 1)
//        return imageViews.indexOf(imageView)! - 1
        if imageTapIndex != nil {
            imageTapIndex!(index: imageViews.indexOf(imageView)! - 1)
        }
        
    }
    
    /**
     *  time-repeat
     */
    func timeRepeat() {
        var page = (Int)(scrollView.contentOffset.x / scrollView.width)
        page+=1
        scrollView.setContentOffset(CGPoint(x: (CGFloat)(page)*(scrollView.width), y: 0), animated: true)
    }
    
    /**
     *  scrollView delegate
     */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        pageTurning()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        print("will")
        timer!.fireDate = NSDate.distantFuture()
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        print("end")
        timer!.fireDate = NSDate(timeIntervalSinceNow: timeInter)
    }
    
    func pageTurning() {
        let page = (Int)(scrollView.contentOffset.x / scrollView.width)
        if page == images.count - 1 {
            scrollView.setContentOffset(CGPoint(x: scrollView.width, y: 0), animated: false)
            pageView.currentPage = 0
            return
        }
        if page == 0 {
            scrollView.setContentOffset(CGPoint(x: (scrollView.width * (CGFloat)(images.count - 2)), y: 0), animated: false)
            pageView.currentPage = images.count - 2
            return
        }
        
        pageView.currentPage = page - 1
        //        print(page - 1)
    }
    
    deinit {
        timer!.invalidate()
        timer = nil
    }
}
