//
//  ViewController.swift
//  ActivityIndicatorButton
//
//  Created by gxcb on 16/5/30.
//  Copyright © 2016年 Jx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testButton.layer.cornerRadius = 8.0
    }
    
    func showAnimate() {
        testButton.showActivityIndicatorStartAnimating(nil)
        sleep(2)
        testButton.showActivityIndicatorStopAnimating()
//        sleep(1)
//        testButton.showActivityIndicatorStartAnimating(.gray)
//        sleep(2)
//        testButton.showActivityIndicatorStopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testButton(_ sender: AnyObject) {
//        showAnimate()
        Thread.detachNewThreadSelector(#selector(showAnimate), toTarget: self, with: nil)
    }
}

