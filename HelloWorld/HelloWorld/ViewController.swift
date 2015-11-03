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
    
    var helloButton = HelloButton()
    
    override func loadView() {
        self.view = AutoLayoutView()  // declare Autolayout class
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor()
        helloButton.addTarget(self, action: Selector("showHelloMessage"), forControlEvents: .TouchUpInside)
        self.view.addSubview(helloButton)

        
    }
    
    @objc func showHelloMessage() {
        print("Hello World")
        
        let helloAlert = UIAlertController(title: "Welcome to My 1st Swift App", message: "Hello World", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(helloAlert, animated:true, completion: nil)
        
        let okayAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil)
        
        helloAlert.addAction(okayAction)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

