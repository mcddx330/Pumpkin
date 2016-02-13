//
//  PKEnums.swift
//  Pumpkin
//
//  Created by dimbow. on 2/13/16.
//  Copyright © 2016 dimbow. All rights reserved.
//

extension Pumpkin {
  enum DeviceType: String {
    case iPhone;
    case iPad;
    case iPadPro;
  }
  
  enum DeviceName: String {
    case iPhone4;
    case iPhone5;
    case iPhone6;
    case iPhone6Plus;
    case iPad;
    case iPadPro;
  }
  
  enum DeviceSizeWidth: CGFloat {
    case less_iPhone5 = 320.0;
    case iPhone6      = 375.0;
    case iPhone6Plus  = 414.0;
    case iPad         = 768.0;
    case iPadPro      = 1366.0;
  }
  
  enum DeviceSizeHeight: CGFloat {
    case iPhone4      = 480.0;
    case iPhone5      = 568.0;
    case iPhone6      = 667.0;
    case iPhone6Plus  = 736.0;
    case iPad         = 1024.0;
    case iPadPro      = 1366.0;
  }
}