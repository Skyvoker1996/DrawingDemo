//
//  Anotaion.swift
//  DrawAnotation
//
//  Created by Michael Gerasimov on 9/3/16.
//  Copyright © 2016 Michael Gerasimov. All rights reserved.
//

import UIKit

class Anotaion: UIView {

    // Annotation Shape Constants
    struct ASC {
        static var height:CGFloat = width * 1.77
        static var width:CGFloat = 150
        static let center = CGPointMake(width/2, height/2)
        static let bottomMiddlePoint = CGPointMake(center.x, height)
        static var controlPoint1 = CGPointMake(0, (ASC.height / 4) * 3)
        static let controlPoint2 = CGPointMake(center.x, (ASC.height / 6) * 5)
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        ASC.height = bounds.size.height
        ASC.width = bounds.size.width
        
        let context = UIGraphicsGetCurrentContext()
        
        let leftSidePath = UIBezierPath(arcCenter: ASC.center, radius: ASC.width/2, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI), clockwise: false)
        
        leftSidePath.addCurveToPoint(ASC.bottomMiddlePoint, controlPoint1: ASC.controlPoint1, controlPoint2: ASC.controlPoint2)
        
        leftSidePath.addArcWithCenter(ASC.center, radius: ASC.width/4, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(-M_PI_2), clockwise: true)
        
        leftSidePath.closePath()
        
        UIColor.greenColor().setFill()
        leftSidePath.fill()
        
        let rightSidePath = leftSidePath
        CGContextTranslateCTM(context,ASC.width,0)
        CGContextScaleCTM (context,-1.0, 1.0)
        
        rightSidePath.fill()
    }
    
    /*func rest()
    {
        // Drawing code
        
        ASC.height = bounds.size.height
        ASC.width = bounds.size.width
        
        let context = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath.init(arcCenter: ASC.center, radius: ASC.width/2, startAngle: 0, endAngle: CGFloat(M_PI), clockwise: false)
        
        path.addCurveToPoint(ASC.bottomMiddlePoint, controlPoint1: ASC.controlPoint1, controlPoint2: ASC.controlPoint2)
        
        path.addLineToPoint(ASC.center)
        path.moveToPoint(ASC.rightMiddlePoint)
        ASC.controlPoint1.x = ASC.width
        
        path.addCurveToPoint(ASC.bottomMiddlePoint, controlPoint1: ASC.controlPoint1, controlPoint2: ASC.controlPoint2)
        path.addLineToPoint(ASC.center)
        
        UIColor.greenColor().setFill()
        UIColor.blueColor().setStroke()
        path.lineWidth = 4
        path.stroke()
        path.fill()
        
        
        //        let circlePath = UIBezierPath.init(arcCenter: ASC.center, radius: ASC.width/4, startAngle: CGFloat(-M_PI), endAngle: CGFloat(M_PI), clockwise: false)
        //        circlePath.addLineToPoint(ASC.center)
        //        CGContextTranslateCTM(context, ASC.width,ASC.height);
        //        CGContextRotateCTM (context, CGFloat(-M_PI));
        let triangularPathLeftPart = UIBezierPath()
        
        triangularPathLeftPart.moveToPoint(CGPointMake(ASC.width / 4, ASC.center.y))
        triangularPathLeftPart.addLineToPoint(ASC.center)
        triangularPathLeftPart.addLineToPoint(CGPointMake(ASC.center.x, ASC.center.y + 40))
        triangularPathLeftPart.closePath()
        
        // UIColor.redColor().setStroke()
        
        UIColor.redColor().setFill()
        triangularPathLeftPart.fill()
        //triangularPathLeftPart.stroke()
        
        let triangularPathRightPart = triangularPathLeftPart
        CGContextTranslateCTM(context,ASC.width,0)
        CGContextScaleCTM (context,-1.0, 1.0)
        
        // UIColor.Color().setFill()
        triangularPathRightPart.fill()
        
        
        //CGContextRotateCTM (context, CGFloat(-M_PI))
    }*/
 

}
