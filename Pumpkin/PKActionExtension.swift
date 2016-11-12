//
//  PKActionExtension.swift
//  Pumpkin
//
//  Created by dimbow. on 2/5/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import SpriteKit

extension SKAction {
    open class PKslideSet {
        open var posX:CGFloat!, posY:CGFloat!;
        private var AlphaIn:SKAction!,  AlphaOut:SKAction!,  AlphaTo:SKAction!,  MoveTo:SKAction!;
        private var targetDuration:CFTimeInterval!;
        private var targetEaseType:SKActionTimingMode!;
        private var targetAlpha:CGFloat!;


        public init(toX:CGFloat?,  toY:CGFloat?,  duration:CFTimeInterval?,  easeType:SKActionTimingMode=SKActionTimingMode.linear,  alpha:CGFloat?) {
            if let tX = toX {
                posX = tX;
            } else {
                posX = 0.0;
            }

            if let tY = toY {
                posY = tY;
            } else {
                posY = 0.0;
            }

            if let tDur = duration {
                targetDuration = tDur;
            } else {
                targetDuration = 1.0;
            }

            if let tAlpha = alpha {
                targetAlpha = tAlpha;
            } else {
                targetAlpha = 1.0
            }

            targetEaseType = easeType;
        }

        open func slideIntoX()->SKAction {
            MoveTo = SKAction.moveTo(x: posX,  duration: targetDuration);
            MoveTo.timingMode = targetEaseType;
            AlphaIn = SKAction.fadeAlpha(to: targetAlpha,  duration: targetDuration);
            return SKAction.sequence([SKAction.group([MoveTo, AlphaIn])]);
        }

        open func slideOutofX()->SKAction {
            MoveTo = SKAction.moveTo(x: posX,  duration: targetDuration);
            MoveTo.timingMode = targetEaseType;
            AlphaOut = SKAction.fadeAlpha(by: targetAlpha,  duration: targetDuration);
            return SKAction.sequence([SKAction.group([MoveTo, AlphaOut])]);
        }

        open func slideIntoY(_ posY:CGFloat,  duration:CFTimeInterval,  targetEaseType:SKActionTimingMode,  alpha:CGFloat?=0)->SKAction {
            MoveTo = SKAction.moveTo(y: posY,  duration: targetDuration);
            MoveTo.timingMode = targetEaseType;
            AlphaIn = SKAction.fadeAlpha(to: targetAlpha,  duration: targetDuration);
            return SKAction.sequence([SKAction.group([MoveTo, AlphaOut])]);
        }

        open func slideOutofY()->SKAction {
            MoveTo = SKAction.moveTo(y: posY,  duration: targetDuration);
            MoveTo.timingMode = targetEaseType;
            AlphaIn = SKAction.fadeAlpha(to: targetAlpha,  duration: targetDuration);
            return SKAction.sequence([SKAction.group([MoveTo, AlphaOut])]);
        }
    }
}
