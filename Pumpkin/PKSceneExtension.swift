//
//  PKSceneExtension.swift
//  Pumpkin
//
//  Created by dimbow. on 2/6/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import SpriteKit

extension SKScene{
    public func PKshowGridLines(color:UIColor?=UIColor.whiteColor()){
        let linevertical = SKSpriteNode(color: color!, size: CGSizeMake(PKPosition.Height.Full.cgfloat, 1));
        linevertical.position = CGPoint(x:PKPosition.Width.Middle.cgfloat, y: PKPosition.Height.Middle.cgfloat)
        let lineverticaldown = SKSpriteNode(color: color!, size: CGSizeMake(PKPosition.Width.Full.cgfloat, 1));
        lineverticaldown.position = CGPoint(x:PKPosition.Width.Middle.cgfloat, y: PKPosition.Height.MiddleDown.cgfloat);
        let lineverticalUp = SKSpriteNode(color: color!, size: CGSizeMake(PKPosition.Width.Full.cgfloat, 1));
        lineverticalUp.position = CGPoint(x:PKPosition.Width.Middle.cgfloat, y: PKPosition.Height.MiddleUp.cgfloat);
        
        let linehorizonal = SKSpriteNode(color: color!, size: CGSizeMake(1, PKPosition.Height.Full.cgfloat));
        linehorizonal.position = CGPoint(x:PKPosition.Width.MiddleLeft.cgfloat, y: PKPosition.Height.Middle.cgfloat)
        let linehorizonalleft = SKSpriteNode(color: color!, size: CGSizeMake(1, PKPosition.Height.Full.cgfloat));
        linehorizonalleft.position = CGPoint(x:PKPosition.Width.Middle.cgfloat, y: PKPosition.Height.Middle.cgfloat);
        let linehorizonalright = SKSpriteNode(color: color!, size: CGSizeMake(1, PKPosition.Height.Full.cgfloat));
        linehorizonalright.position = CGPoint(x:PKPosition.Width.MiddleRight.cgfloat, y: PKPosition.Height.Middle.cgfloat);
        
        let lines = [linevertical,lineverticaldown,lineverticalUp,linehorizonal,linehorizonalleft,linehorizonalright];
        
        for (var i=0;i<lines.count;i++){
            lines[i].zPosition = CGFloat.max;
            self.addChild(lines[i]);
        }
    }
    public func PKfetchViewSize()->(Height:CGFloat,Width:CGFloat){
        return (PKPosition.Height.Full.cgfloat,PKPosition.Width.Full.cgfloat);
    }
}