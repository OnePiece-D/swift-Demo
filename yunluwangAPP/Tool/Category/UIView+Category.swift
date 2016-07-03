//
//  UIView+Category.swift
//  yunluwangAPP
//
//  Created by 王亚龙 on 16/7/2.
//  Copyright © 2016年 WYL. All rights reserved.
//

import UIKit

extension UIView {
    var x :CGFloat {
        set
        {
            self.frame.origin.x = newValue
        }
        get
        {
            return self.frame.origin.x
        }
    }
    
    
    var y :CGFloat {
        set
        {
            self.frame.origin.y = newValue
        }
        get
        {
            return self.frame.origin.y
        }
    }
    var width :CGFloat {
        set
        {
            self.frame.size.width = newValue
        }
        get
        {
            return self.frame.size.width
        }
    }
    var height :CGFloat {
        set
        {
            self.frame.size.height = newValue
        }
        get
        {
            return self.frame.size.height
        }
    }
    var origin :CGPoint {
        set
        {
            self.frame.origin = newValue
        }
        get
        {
            return self.frame.origin
        }
    }
    var size :CGSize {
        set
        {
            self.frame.size = newValue
        }
        get
        {
            return self.frame.size
        }
    }
}