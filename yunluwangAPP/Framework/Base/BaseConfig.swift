//
//  BaseConfig.swift
//  yunluwangAPP
//
//  Created by 王亚龙 on 16/7/2.
//  Copyright © 2016年 WYL. All rights reserved.
//

import UIKit

#if DEBUG
    
#else
    
#endif


/**
 *  宏定义:属性
 */

/**
 *  屏幕宽度
 */
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
/**
 *  屏幕高度
 */
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
/**
 *  状态栏高度
 */
let STATUS_BAR_HEIGTH = UIApplication.sharedApplication().statusBarFrame.size.height
/**
 *  尺寸比:宽比
 */
let SCALE_WIDTH = SCREEN_WIDTH / 375
/**
 *  尺寸比:高比
 */
let SCALE_HEIGHT = SCREEN_HEIGHT / 667


/**
 *  宏定义:方法
 */



//关于颜色
func PIX_COLOR(pix:CGFloat) -> UIColor {
    let red = pix / 10000
    let blue = pix % 100
    let green = (pix % 10000 - blue )/100
    return RGB(red:red, green: blue, blue: green)
}

func RGB(red red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    return UIColor(red: red/255.0 ,green: green/255.0,blue: blue/255.0, alpha: 1.0)
}

func ImageWithColor(color:UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}


//关于大小
func Font(font:CGFloat) -> UIFont {
    let font = UIFont.systemFontOfSize(font)
    return font
}

func FontW(font size:CGFloat, weight:CGFloat) -> UIFont {
    let font = UIFont.systemFontOfSize(size, weight: weight)
    return font
}