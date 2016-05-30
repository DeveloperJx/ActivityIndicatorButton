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
    func showActivityIndicatorStartAnimating() {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 20.0, height: 20.0)))
        activityIndicator.center = CGPoint(x: self.frame.width / 2.0, y: self.frame.height / 2.0)
        dispatch_async(dispatch_get_main_queue()) { 
            [weak self]() in
            self?.addSubview(activityIndicator)
            self?.enabled = false
            if self != nil {
                NSThread.detachNewThreadSelector(#selector(self!.syncTitleAndImageHideState), toTarget: self!, withObject: nil)
            }
        }
        activityIndicator.startAnimating()
    }
    
    ///关闭加载指示器
    func showActivityIndicatorStopAnimating() {
        dispatch_async(dispatch_get_main_queue()) {
            [weak self]() in
            let subviews = self?.subviews
            if subviews != nil {
                for subView in subviews! {
                    if subView.isKindOfClass(UIActivityIndicatorView.classForCoder()) {
                        if self != nil {
                            subView.removeFromSuperview()
                        }
                    }
                }
                self?.enabled = true
            }
        }
    }
    
    ///同步button的title和image的隐藏状态
    @objc private func syncTitleAndImageHideState() {
        var keep = true
        while keep {
            keep = false
            for subView in self.subviews {
                if subView.isKindOfClass(UIActivityIndicatorView.classForCoder()) {
                    keep = true
                    dispatch_async(dispatch_get_main_queue()) {
                        [weak self]() in
                        self?.titleLabel?.hidden = true
                        self?.imageView?.hidden = true
                    }
                }
            }
            usleep(100)
            if !keep {
                dispatch_async(dispatch_get_main_queue()) {
                    [weak self]() in
                    self?.titleLabel?.hidden = false
                    self?.imageView?.hidden = false
                }
            }
        }
    }
}
