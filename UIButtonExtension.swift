//
//  UIButtonExtension.swift
//  YunYou
//
//  Created by Jx on 16/5/21.
//  Copyright © 2016年 gxcb. All rights reserved.
//

import UIKit

extension UIButton {
    
    ///显示加载指示器
    func showActivityIndicatorStartAnimating(style: UIActivityIndicatorViewStyle?) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 20.0, height: 20.0)))
            if style != nil {
                activityIndicator.activityIndicatorViewStyle = style!
            }
            activityIndicator.center = CGPoint(x: self.frame.width / 2.0, y: self.frame.height / 2.0)
            dispatch_async(dispatch_get_main_queue()) {
                self.titleLabel?.transform = CGAffineTransformMakeScale(0.015, 0.015)
                self.imageView?.transform = CGAffineTransformMakeScale(0.015, 0.015)
                self.addSubview(activityIndicator)
            }
            self.enabled = false
            activityIndicator.startAnimating()
        }
    }
    
    ///关闭加载指示器
    func showActivityIndicatorStopAnimating() {
        for subView in subviews {
            if subView.isKindOfClass(UIActivityIndicatorView.classForCoder()) {
                dispatch_async(dispatch_get_main_queue()) {
                    subView.removeFromSuperview()
                    self.titleLabel?.transform = CGAffineTransformIdentity
                    self.imageView?.transform = CGAffineTransformIdentity
                }
            }
        }
        self.enabled = true
    }
}
