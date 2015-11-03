
//  HelloButton.swift
//  HelloWorld
//
//  Created by KaL on 11/3/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit

class HelloButton: UIButton {
    
    var ViewC = ViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRectMake(SCREEN_WIDTH/2 - 140, SCREEN_HEIGHT/2 - 30, 280, 30)
        self.backgroundColor = UIColor.redColor()
        self.setTitle("Hello World", forState: .Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.layer.cornerRadius = 6
        
    }
    
    func setupView(){
//        self.frame.setTranslatesAutoresizingMaskIntoConstraints(false)
        
//        self.addSubview(self.blueView!)
        
        let ViewCenterXConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: ViewC, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        
        let ViewCenterYConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: ViewC, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
        
        let ViewWidthConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 200)
        
        let ViewHeightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 200)
        
        self.addConstraints([ViewCenterXConstraint,ViewCenterYConstraint,ViewWidthConstraint,ViewHeightConstraint])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
