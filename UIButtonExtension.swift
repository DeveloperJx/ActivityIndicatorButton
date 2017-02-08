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
    func showActivityIndicatorStartAnimating(_ style: UIActivityIndicatorViewStyle?) {
        DispatchQueue(label: "com.dispatch.serial").async {
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 20.0, height: 20.0)))
            if style != nil {
                activityIndicator.activityIndicatorViewStyle = style!
            }
            DispatchQueue.main.sync {
                self.titleLabel?.transform = CGAffineTransform(scaleX: 100000, y: 100000)
                self.imageView?.transform = CGAffineTransform(scaleX: 100000, y: 100000)
                self.addSubview(activityIndicator)
                activityIndicator.center = CGPoint(x: self.frame.width / 2.0, y: self.frame.height / 2.0)
                activityIndicator.startAnimating()
                self.isEnabled = false
            }
        }
    }
    
    ///关闭加载指示器
    func showActivityIndicatorStopAnimating() {
        DispatchQueue(label: "com.dispatch.serial").async {
            for subView in self.subviews {
                if subView.isKind(of: UIActivityIndicatorView.classForCoder()) {
                    DispatchQueue.main.sync {
                        subView.removeFromSuperview()
                        self.titleLabel?.transform = CGAffineTransform.identity
                        self.imageView?.transform = CGAffineTransform.identity
                        self.isEnabled = true
                    }
                }
            }
        }
    }
}

