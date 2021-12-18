//
//  DrawSetOneRectView.swift
//  AlgoSort
//
//  Created by Dewone Westerfield on 4/19/21.
//

import UIKit

class DrawSetOneRectView: UIView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    @IBOutlet weak var mainViewData : UIViewController!
    override func draw(_ rect: CGRect){
        // Drawing code
        var trackPos: Int = 2;
        for i in 0..<arrOne.count{
            if let context = UIGraphicsGetCurrentContext(){
                context.setStrokeColor(UIColor.orange.cgColor);
                context.setFillColor(UIColor.orange.cgColor);
                context.setLineWidth(1.5);
                let space: Int = 1;
                let width : Int = Int(bounds.width)/arrOne.count-space;
                let height = Int(bounds.height)/arrOne.count;
                context.fill(CGRect(x: i*(width+space), y: 275, width: width, height: -arrOne[i]*height))
                trackPos += 1;
            }
        }
        
    }

}
