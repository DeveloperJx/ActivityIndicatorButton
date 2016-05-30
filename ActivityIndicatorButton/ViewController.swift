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
    
    func show() {
        testButton.showActivityIndicatorStartAnimating()
        sleep(2)
        testButton.showActivityIndicatorStopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testButton(sender: AnyObject) {
        NSThread.detachNewThreadSelector(#selector(ViewController.show), toTarget: self, withObject: nil)
    }
}

