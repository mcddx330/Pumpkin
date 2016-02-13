//
//  PKActionExtension.swift
//  Pumpkin
//
//  Created by dimbow. on 2/5/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import SpriteKit

extension SKAction{
  public class PKslideSet{
    private var AlphaIn:SKAction!, AlphaOut:SKAction!, AlphaTo:SKAction!, MoveTo:SKAction!;
    public var posX:CGFloat!,posY:CGFloat!;
    private var targetDuration:CFTimeInterval!;
    private var targetEaseType:SKActionTimingMode!;
    private var targetAlpha:CGFloat!;
    
    
    public init(toX:CGFloat?, toY:CGFloat?, duration:CFTimeInterval?, easeType:SKActionTimingMode=SKActionTimingMode.Linear, alpha:CGFloat?){
      if let tX = toX{
        posX = tX;
      }else{
        posX = 0.0;
      }
      
      if let tY = toY{
        posY = tY;
      }else{
        posY = 0.0;
      }
      
      if let tDur = duration{
        targetDuration = tDur;
      }else{
        targetDuration = 1.0;
      }
      
      if let tAlpha = alpha{
        targetAlpha = tAlpha;
      }else{
        targetAlpha = 1.0
      }
      
      targetEaseType = easeType;
    }
    
    public func slideIntoX ()->SKAction{
      MoveTo = SKAction.moveToX(posX, duration: targetDuration);
      MoveTo.timingMode = targetEaseType;
      AlphaIn = SKAction.fadeAlphaTo(targetAlpha, duration: targetDuration);
      return SKAction.sequence([SKAction.group([MoveTo,AlphaIn])]);
    }
    
    public func slideOutofX ()->SKAction{
      MoveTo = SKAction.moveToX(posX, duration: targetDuration);
      MoveTo.timingMode = targetEaseType;
      AlphaOut = SKAction.fadeAlphaBy(targetAlpha, duration: targetDuration);
      return SKAction.sequence([SKAction.group([MoveTo,AlphaOut])]);
    }
    
    public func slideIntoY (posY:CGFloat, duration:CFTimeInterval, targetEaseType:SKActionTimingMode, alpha:CGFloat?=0)->SKAction{
      MoveTo = SKAction.moveToY(posY, duration: targetDuration);
      MoveTo.timingMode = targetEaseType;
      AlphaIn = SKAction.fadeAlphaTo(targetAlpha, duration: targetDuration);
      return SKAction.sequence([SKAction.group([MoveTo,AlphaOut])]);
    }
    
    public func slideOutofY()->SKAction{
      MoveTo = SKAction.moveToY(posY, duration: targetDuration);
      MoveTo.timingMode = targetEaseType;
      AlphaIn = SKAction.fadeAlphaTo(targetAlpha, duration: targetDuration);
      return SKAction.sequence([SKAction.group([MoveTo,AlphaOut])]);
    }
  }
}