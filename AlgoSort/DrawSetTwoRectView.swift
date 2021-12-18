//
//  DrawSetTwoRectView.swift
//  AlgoSort
//
//  Created by Dewone Westerfield on 4/19/21.
//
import UIKit


//var arrOne = [Int]();

class DrawSetTwoRectView: UIView {
    
    // var initialN : Int = 16;
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        var trackPos: Int = 2;
        for i in 0..<arrTwo.count{
            if let context = UIGraphicsGetCurrentContext(){
                context.setStrokeColor(UIColor.green.cgColor);
                context.setFillColor(UIColor.green.cgColor);
                context.setLineWidth(1.5);
                let space: Int = 1;
                let width : Int = Int(bounds.width)/arrTwo.count-space;
                let height = Int(bounds.height)/arrTwo.count;
                context.fill(CGRect(x: i*(width+space), y: 275, width: width, height: -arrTwo[i]*height))
                trackPos += 1;
//                context.strokePath()
            }
        }
        
    }

}
