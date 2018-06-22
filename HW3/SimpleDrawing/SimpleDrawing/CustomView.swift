//
//  CustomView.swift
//  SimpleDrawing
//
//  Created by Darkhan on 05.02.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
@IBDesignable
class CustomView: UIView {
    
    @IBInspectable
    var color: UIColor = UIColor.black
    
    
    @IBInspectable
    var width: CGFloat = 1.0
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    @IBInspectable
    var scale: CGFloat = 0.9
    
    var vc: ViewController?
    var global_point1: CGPoint?
    var global_point2: CGPoint?
    let line = UIBezierPath()
    override func draw(_ rect: CGRect) {
        // Drawing code
        color.set()
        let circle = drawCircle()
        circle.stroke()
        let rect = drawRect()
        rect.stroke()
        line.stroke()
//        if let nonOptionalGlobalPoint = global_point{
//            if circle.contains(nonOptionalGlobalPoint){
//                vc?.changeTitle("Circle")
//            }else if rect.contains(nonOptionalGlobalPoint){
//                vc?.changeTitle("Rectangle")
//            }else{
//                vc?.changeTitle("Outside")
//            }
//        }
    }
    
    
    
    
    func drawCircle()-> UIBezierPath{
        
        let circle_center = CGPoint(x: bounds.width/4, y: bounds.height/2)
        let circle_radius = min(bounds.height/4, bounds.width/4)*scale
        let path = UIBezierPath(arcCenter: circle_center, radius: circle_radius, startAngle: 0.0, endAngle: CGFloat(2*Double.pi), clockwise: false)
        path.lineWidth = width
        return path
        
    }
    func drawRect()-> UIBezierPath{
        
        let rectOrigin = CGPoint(x: bounds.width/2, y: bounds.height/2-min(bounds.height/4, bounds.width/4)*scale)
        let rectSize = CGSize(width: min(bounds.height/4, bounds.width/4)*scale*2, height: min(bounds.height/4, bounds.width/4)*scale*2)
        let rect = CGRect(origin: rectOrigin, size: rectSize)
        let path = UIBezierPath(rect: rect)
        path.lineWidth = width
        return path
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        global_point1 = touches.first?.location(in: self)
        line.move(to: global_point1!)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        global_point2 = touches.first?.location(in: self)
        line.addLine(to: global_point2!)
        line.lineWidth = width
        
        setNeedsDisplay()
       
    }
}
