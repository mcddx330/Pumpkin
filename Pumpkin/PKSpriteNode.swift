//
//  PKSpriteNode.swift
//  Pumpkin
//
//  Created by dimbow. on 2/14/16.
//  Copyright © 2016 dimbow. All rights reserved.
//

import SpriteKit

public class PKSpriteNode {
  private var texture:SKTexture!;
  private var node:SKSpriteNode!;
  private var anchor:Dictionary<String, CGFloat> = ["x":0, "y":0];
  private var position:Dictionary<String, CGFloat> = ["x":0 ,"y":0 ,"z":0];
  private var alpha:CGFloat = 1;
  private var name:String? = nil;
  
  public var scale_on_iPhone:CGFloat!;
  public var scale_on_iPad:CGFloat!;
  
  public init(texture: SKTexture, anchor:CGPoint = CGPointMake(0, 0) , scale: CGFloat = 1, position: CGPoint = CGPoint(x: 0, y: 0), position_z:CGFloat = 0, alpha:CGFloat = 1, name: String? = nil) {
    self.texture = texture;
    
    // check anchor numeric.
    if let ax:CGFloat = anchor.x {
      self.anchor["x"] = ax;
    }
    
    if let ay:CGFloat = anchor.y {
      self.anchor["y"] = ay;
    }

    // check position numeric.
    if let posx:CGFloat = position.x {
      self.position["x"] = posx;
    }
    
    if let posy:CGFloat = position.y {
      self.position["y"] = posy;
    }
    
    self.position["z"] = position_z;
    self.scale_on_iPhone = scale;
    self.scale_on_iPad = scale;
    self.alpha = alpha;
    
    if let n = name {
      self.name = n;
    }
  }
  
  public func create() -> SKSpriteNode {
    self.node = SKSpriteNode(texture: self.texture);
    node.anchorPoint = CGPoint(x: self.anchor["x"]!, y: self.anchor["y"]!);
    node.position = CGPoint(x: self.position["x"]!, y: self.position["y"]!);
    node.zPosition = self.position["z"]!;
    node.alpha = self.alpha;
    node.name = self.name!;

    if (Pumpkin().detectDeviceType() == Pumpkin.DeviceType.iPhone.rawValue) {
      self.node.setScale(self.scale_on_iPhone);
    } else if (Pumpkin().detectDeviceType() == Pumpkin.DeviceType.iPad.rawValue
      || Pumpkin().detectDeviceType() == Pumpkin.DeviceType.iPadPro.rawValue) {
      self.node.setScale(self.scale_on_iPad);
    }
    
    return self.node;
  }
}