//
//  main.swift
//  Pumpkin
//
//  Created by dimbow. on 2/5/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import SpriteKit

private var AlphaIn:SKAction!, AlphaOut:SKAction!, AlphaTo:SKAction!, MoveTo:SKAction!;

extension SKAction{
    public class PKslideInToX{
        public init (toX:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode, alpha:CGFloat?=1.0){
            MoveTo = SKAction.moveToX(toX, duration: duration);
            MoveTo.timingMode = easeType;
            AlphaIn = SKAction.fadeAlphaTo(alpha!, duration: duration);
        }
        
        public func PKApply()->SKAction{
            return SKAction.sequence([SKAction.group([MoveTo,AlphaIn])]);
        }
    }
    
    public class PKslideOutToX{
        public init (toX:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode, alpha:CGFloat?=0.0){
            MoveTo = SKAction.moveToX(toX, duration: duration);
            MoveTo.timingMode = easeType;
            AlphaOut = SKAction.fadeAlphaBy(alpha!, duration: duration);
        }
        
        public func PKApply()->SKAction{
            return SKAction.sequence([SKAction.group([MoveTo,AlphaOut])]);
        }
    }
    
    public class PKslideOutToY{
        public init (toY:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode, alpha:CGFloat?=1.0){
            MoveTo = SKAction.moveToY(toY, duration: duration);
            MoveTo.timingMode = easeType;
            AlphaIn = SKAction.fadeAlphaTo(alpha!, duration: duration);
        }
        
        public func PKApply()->SKAction{
            return SKAction.sequence([SKAction.group([MoveTo,AlphaOut])]);
        }
    }
    
    public class PKslideInToY{
        public init (toY:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode, alpha:CGFloat?=0){
            MoveTo = SKAction.moveToY(toY, duration: duration);
            MoveTo.timingMode = easeType;
            AlphaIn = SKAction.fadeAlphaTo(alpha!, duration: duration);
        }
        
        public func PKApply()->SKAction{
            return SKAction.sequence([SKAction.group([MoveTo,AlphaOut])]);
        }
    }
}