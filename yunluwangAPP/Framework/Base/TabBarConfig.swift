//
//  TabBarConfig.swift
//  yunluwangAPP
//
//  Created by 王亚龙 on 16/7/2.
//  Copyright © 2016年 WYL. All rights reserved.
//

import UIKit

class MyTabBarConfig: NSObject {
    let indexVC = WYLNaviController(rootViewController:WYLIndexViewController())
    let infoVC = WYLNaviController(rootViewController:WYLInfoViewController())
    let mineVC = WYLNaviController(rootViewController:WYLMineViewController())
    
    let tabBar = WYLCustomTabBarController()
    
    func instance() -> WYLCustomTabBarController {
        indexVC.title = "首页"
        infoVC.title = "消息"
        mineVC.title = "我的"
        
        
        tabBar.viewControllers = [indexVC,infoVC,mineVC]
        naviConfig()
        
        
        return tabBar
    }
    
    func naviConfig() {
        let navi = UINavigationBar.appearance()
        navi.translucent = false
        
        navi.setBackgroundImage(ImageWithColor(RGB(red: 0, green: 255, blue: 255)), forBarMetrics: .Default)
    }
}