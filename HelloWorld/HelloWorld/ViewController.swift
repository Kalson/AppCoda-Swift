//
//  ViewController.swift
//  HelloWorld
//
//  Created by KaL on 11/2/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let hwButton = UIButton(frame: CGRectMake(SCREEN_WIDTH/2 - 140, SCREEN_HEIGHT/2 - 30, 280, 30))
        hwButton.setTitle("Hello World", forState: .Normal)
        hwButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        hwButton.addTarget(self, action: Selector("showHelloMessage"), forControlEvents: .TouchUpInside)
//        hwButton.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(hwButton)
    }
    
    @objc func showHelloMessage() {
        print("Hello World")
        
//        let helloAlert = UIAlertController(title: "Alert", message: "Hello World", preferredStyle: <#T##UIAlertControllerStyle#>))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

