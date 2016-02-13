//
//  Pumpkin.swift
//  Pumpkin
//
//  Created by dimbow. on 2/13/16.
//  Copyright © 2016 dimbow. All rights reserved.
//

import Foundation

public class Pumpkin {
  
  public init() {
    
  }

  public func detectOrientation() -> Int {
    let orientation = UIApplication.sharedApplication().statusBarOrientation;
    
    if (orientation.isPortrait == true) {
      return 0;
    } else if (orientation.isLandscape == true) {
      return 1;
    }
    
    return -1;
  }
  
  public func detectDevice() -> String {
    let size = UIScreen.mainScreen().bounds.size;
    var base_size:CGFloat = 0;

    // Always detect device on "width size".
    if (detectOrientation() == 0) {
      // Portrait
      base_size = size.width
    } else if (detectOrientation() == 1) {
      // Landscape
      base_size = size.height;
    } else {
      return "Cannot detect device.";
    }
    
    switch base_size {
    case DeviceSizeWidth.less_iPhone5.rawValue:
      if (size.height == DeviceSizeHeight.iPhone4.rawValue) {
        return DeviceName.iPhone4.rawValue;
      }
      return DeviceName.iPhone5.rawValue;
    case DeviceSizeWidth.iPhone6.rawValue:
      return DeviceName.iPhone6.rawValue;
    case DeviceSizeWidth.iPhone6Plus.rawValue:
      return DeviceName.iPhone6Plus.rawValue;
    case DeviceSizeWidth.iPad.rawValue:
      return DeviceName.iPad.rawValue;
    case DeviceSizeWidth.iPadPro.rawValue:
      return DeviceName.iPadPro.rawValue;
      
    default:
      return "Unknown device";
    }
  }
}