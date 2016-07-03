//
//  WYLIndexViewController.swift
//  yunluwangAPP
//
//  Created by 王亚龙 on 16/7/2.
//  Copyright © 2016年 WYL. All rights reserved.
//

import UIKit


class WYLIndexViewController: WYLBaseViewController {
    
    let topBannerView : WYLCircleImageView = WYLCircleImageView(frame:CGRect(origin: CGPoint(x:0,y:0),size: CGSize(width:SCREEN_WIDTH,height: SCREEN_WIDTH/2)), images:["image1","image2","image3"])
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.hidesBottomBarWhenPushed = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        self.naviTitle = "车主版"
        super.viewDidLoad()
        self.navigationItem.title = "车主版"
        
        setSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setSubViews() {
        self.view.addSubview(topBannerView)
        topBannerView.imageTapIndex = { index in
            self.tapImageAction(index)
        }
    }
    

    func tapImageAction(index:Int) {
        let detailVC = WYLBannerDetailController()
        detailVC.navigationItem.title = "Banner\(index)"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
