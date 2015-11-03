//
//  AutoLayoutView.swift
//  HelloWorld
//
//  Created by KaL on 11/3/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit

class AutoLayoutView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
//    func setupView(){
//        
//        self.blueView = UIView()
//        self.blueView?.backgroundColor = UIColor.blueColor()
//        self.blueView?.setTranslatesAutoresizingMaskIntoConstraints(false)
//        
//        self.addSubview(self.blueView!)
//        
//        let blueViewCenterXConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
//        
//        let blueViewCenterYConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0)
//        
//        let blueViewWidthConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 200)
//        
//        let blueViewHeightConstraint = NSLayoutConstraint(item: self.blueView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 200)
//        
//        self.addConstraints([blueViewCenterXConstraint,blueViewCenterYConstraint,blueViewWidthConstraint,blueViewHeightConstraint])
//    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
