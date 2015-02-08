//
//  main.swift
//  Pumpkin
//
//  Created by dimbow. on 2/5/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import SpriteKit

private var AlphaIn:SKAction!;
private var AlphaOut:SKAction!;
private var AlphaTo:SKAction!;
private var MoveTo:SKAction!;

extension SKAction{
    public class PKSlideInToX{
        public init (toX:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode){
            AlphaIn = SKAction.fadeAlphaTo(0, duration: 0);
            MoveTo = SKAction.moveToX(toX, duration: duration);
            MoveTo.timingMode = easeType;
            AlphaOut = SKAction.fadeAlphaBy(1, duration: duration);
        }
        
        public func PKApply()->SKAction{
            return SKAction.sequence([SKAction.group([AlphaIn,MoveTo,AlphaOut])]);
        }
    }
    
    public class PKSlideOutToX{
        public init (toX:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode){
            AlphaIn = SKAction.fadeAlphaTo(1, duration: 0);
            MoveTo = SKAction.moveToX(toX, duration: duration);
            MoveTo.timingMode = easeType;
            AlphaOut = SKAction.fadeAlphaBy(0, duration: duration);
        }
        
        public func PKApply()->SKAction{
            return SKAction.sequence([SKAction.group([AlphaIn,MoveTo,AlphaOut])]);
        }
    }
    
    public class PKSlideOutToY{
        public init (toY:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode){
            AlphaIn = SKAction.fadeAlphaTo(1, duration: 0);
            MoveTo = SKAction.moveToY(toY, duration: duration);
            MoveTo.timingMode = easeType;
            AlphaOut = SKAction.fadeAlphaBy(0, duration: duration);
        }
        
        public func PKApply()->SKAction{
            return SKAction.sequence([SKAction.group([AlphaIn,MoveTo,AlphaOut])]);
        }
    }
    
    public class PKSlideInToY{
        public init (toY:CGFloat, duration:CFTimeInterval, easeType:SKActionTimingMode){
            AlphaIn = SKAction.fadeAlphaTo(1, duration: 0);
            MoveTo = SKAction.moveToY(toY, duration: duration);
            MoveTo.timingMode = easeType;
            AlphaOut = SKAction.fadeAlphaBy(0, duration: duration);
        }
        
        public func PKApply()->SKAction{
            return SKAction.sequence([SKAction.group([AlphaIn,MoveTo,AlphaOut])]);
        }
    }
}