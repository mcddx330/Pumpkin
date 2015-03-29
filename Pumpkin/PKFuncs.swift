//
//  PKFuncs.swift
//  Pumpkin
//
//  Created by dimbow. on 3/29/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//


private let view_height = (cgfloat:UIScreen.mainScreen().bounds.size.height,double:Double(UIScreen.mainScreen().bounds.size.height));
private let view_width = (cgfloat:UIScreen.mainScreen().bounds.size.width,double:Double(UIScreen.mainScreen().bounds.size.width));
private let view_middle_height = (cgfloat:view_height.cgfloat/2,double:view_height.double/2);
private let view_middle_width = (cgfloat:view_width.cgfloat/2,double:view_width.double/2);

private let view_middle_height_middleup = (cgfloat:view_middle_height.cgfloat+(view_middle_height.cgfloat/2),double:(view_middle_height.double)+(view_middle_height.double/2));
private let view_middle_height_middledown = (cgfloat:view_middle_height.cgfloat/2,double:view_middle_height.double/2);
private let view_middle_width_middleleft = (cgfloat:view_middle_width.cgfloat/2,double:view_middle_width.double/2);
private let view_middle_width_middleright = (cgfloat:view_middle_width.cgfloat+(view_middle_width.cgfloat/2),double:view_middle_width.double+(view_middle_width.double/2));

public let PKPosition = (
    Height:(
        Full:view_height,
        Middle:view_middle_height,
        MiddleUp:view_middle_height_middleup,
        MiddleDown:view_middle_height_middledown
    ),
    Width:(
        Full:view_width,
        Middle:view_middle_width,
        MiddleLeft:view_middle_width_middleleft,
        MiddleRight:view_middle_width_middleright
    )
);