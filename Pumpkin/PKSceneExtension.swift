//
//  PKFuncs.swift
//  Pumpkin
//
//  Created by dimbow. on 2/6/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import Foundation
import SpriteKit

private let view_height = (cgfloat:UIScreen.mainScreen().bounds.size.height,double:Double(UIScreen.mainScreen().bounds.size.height));
private let view_width = (cgfloat:UIScreen.mainScreen().bounds.size.width,double:Double(UIScreen.mainScreen().bounds.size.width));
private let view_half_height = (cgfloat:view_height.cgfloat/2,double:view_height.double/2);
private let view_half_width = (cgfloat:view_width.cgfloat/2,double:view_width.double/2);

private let view_half_height_halfup = (cgfloat:view_half_height.cgfloat+(view_half_height.cgfloat/2),double:(view_half_height.double)+(view_half_height.double/2));
private let view_half_height_halfdown = (cgfloat:view_half_height.cgfloat/2,double:view_half_height.double/2);
private let view_half_width_halfleft = (cgfloat:view_half_width.cgfloat/2,double:view_half_width.double/2);
private let view_half_width_halfright = (cgfloat:view_half_width.cgfloat+(view_half_width.cgfloat/2),double:view_half_width.double+(view_half_width.double/2));

private let viewpos = (height:(full:view_height,
    half:view_half_height,
    half_up:view_half_height_halfup,
    half_down:view_half_height_halfdown),
    width:(full:view_width,
        half:view_half_width,
        half_left:view_half_width_halfleft,
        half_right:view_half_width_halfright
    )
);


extension SKScene{
    public func PKshowGridLines(){
        let line_vertical = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(viewpos.width.full.cgfloat, 1));
        line_vertical.position = CGPoint(x:viewpos.width.half.cgfloat, y: viewpos.height.half.cgfloat)
        let line_vertical_down = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(viewpos.width.full.cgfloat, 1));
        line_vertical_down.position = CGPoint(x:viewpos.width.half.cgfloat, y: viewpos.height.half_down.cgfloat);
        let line_vertical_up = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(viewpos.width.full.cgfloat, 1));
        line_vertical_up.position = CGPoint(x:viewpos.width.half.cgfloat, y: viewpos.height.half_up.cgfloat);
        
        let line_horizonal = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(1, viewpos.height.full.cgfloat));
        line_horizonal.position = CGPoint(x:viewpos.width.half_left.cgfloat, y: viewpos.height.half.cgfloat)
        let line_horizonal_left = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(1, viewpos.height.full.cgfloat));
        line_horizonal_left.position = CGPoint(x:viewpos.width.half.cgfloat, y: viewpos.height.half.cgfloat);
        let line_horizonal_right = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(1, viewpos.height.full.cgfloat));
        line_horizonal_right.position = CGPoint(x:viewpos.width.half_right.cgfloat, y: viewpos.height.half.cgfloat);
        
        let lines = [line_vertical,line_vertical_down,line_vertical_up,line_horizonal,line_horizonal_left,line_horizonal_right];
        
        for (var i=0;i<lines.count;i++){
            lines[i].zPosition = CGFloat.max;
            self.addChild(lines[i])
        }
    }
    public func PKfetchViewSize()->(Height:CGFloat,Width:CGFloat){
        return (view_height.cgfloat,view_width.cgfloat);
    }
}