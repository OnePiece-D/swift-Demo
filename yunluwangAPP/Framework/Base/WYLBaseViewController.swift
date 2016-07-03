//
//  WYLBaseViewController.swift
//  yunluwangAPP
//
//  Created by 王亚龙 on 16/7/2.
//  Copyright © 2016年 WYL. All rights reserved.
//

import UIKit

class WYLBaseViewController: UIViewController {
    
    var naviTitle:String?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        //添加naviTitle
        addNaviTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func addNaviTitle() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 44))
        label.text = naviTitle!
        label.textAlignment = .Center
        
        label.font = Font(18)
        label.textColor = UIColor.orangeColor()
        
        self.navigationItem.titleView = label
    }
}
