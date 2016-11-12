//
//  Pumpkin.swift
//  Pumpkin
//
//  Created by dimbow. on 2/13/16.
//  Copyright © 2016 dimbow. All rights reserved.
//

import Foundation

typealias detectDeviceTuple = (
    Type: String,
    Name: String,
    Size: (
        Width: CGFloat,
        Height: CGFloat
    )
)

open class Pumpkin {
    public init() {
    }

    public func detectOrientation() -> Int {
        let orientation = UIApplication.shared.statusBarOrientation;

        if (orientation.isPortrait == true) {
            return 0;
        }
        if (orientation.isLandscape == true) {
            return 1;
        }

        return -1;
    }

    public func detectDeviceType() -> String {
        return detectDevice().Type;
    }

    public func detectDeviceName() -> String {
        return detectDevice().Name;
    }

    public func detectDeviceSize() -> (Height:CGFloat, Width: CGFloat) {
        return (
            Height: detectDevice().Size.Height,
            Width : detectDevice().Size.Width
        );
    }


    private func detectDevice() -> detectDeviceTuple {
        let size = UIScreen.main.bounds.size;
        var base_size:CGFloat = 0;

        // Always detect device on "width size".
        if (detectOrientation() == 0) {
            // Portrait
            base_size = size.width
        } else if (detectOrientation() == 1) {
            // Landscape
            base_size = size.height;
        } else {
            return (
                Type: "Unknown type.",
                Name: "Cannot detect device.",
                Size: (
                    Height : 0,
                    Width: 0
                )
            );
        }

        switch base_size {
        case DeviceSizeWidth.less_iPhone5.rawValue:
            if (size.height == DeviceSizeHeight.iPhone4.rawValue) {
                return (
                    Type: DeviceType.iPhone.rawValue,
                    Name: DeviceName.iPhone4.rawValue,
                    Size: (
                        Height: DeviceSizeHeight.iPhone4.rawValue,
                        Width : DeviceSizeWidth.less_iPhone5.rawValue
                    )
                )
            }

            return (
                Type: DeviceType.iPhone.rawValue,
                Name: DeviceName.iPhone5.rawValue,
                Size: (
                    Height: DeviceSizeHeight.iPhone5.rawValue,
                    Width : DeviceSizeWidth.less_iPhone5.rawValue
                )
            )
        case DeviceSizeWidth.iPhone6.rawValue:
            return (
                Type: DeviceType.iPhone.rawValue,
                Name: DeviceName.iPhone6.rawValue,
                Size: (
                    Height: DeviceSizeHeight.iPhone6.rawValue,
                    Width : DeviceSizeWidth.iPhone6.rawValue
                )
            )
        case DeviceSizeWidth.iPhone6Plus.rawValue:
            return (
                Type: DeviceType.iPhone.rawValue,
                Name: DeviceName.iPhone6Plus.rawValue,
                Size: (
                    Height: DeviceSizeHeight.iPhone6Plus.rawValue,
                    Width : DeviceSizeWidth.iPhone6Plus.rawValue
                )
            )
        case DeviceSizeWidth.iPad.rawValue:
            return (
                Type: DeviceType.iPad.rawValue,
                Name: DeviceName.iPad.rawValue,
                Size: (
                    Height: DeviceSizeHeight.iPad.rawValue,
                    Width : DeviceSizeWidth.iPad.rawValue
                )
            )
        case DeviceSizeWidth.iPadPro.rawValue:
            return (
                Type: DeviceType.iPad.rawValue,
                Name: DeviceName.iPadPro.rawValue,
                Size: (
                    Height: DeviceSizeHeight.iPadPro.rawValue,
                    Width : DeviceSizeWidth.iPadPro.rawValue
                )
            )
            
        default:
            return (
                Type: "Unknown type.",
                Name: "Unknown device.",
                Size: (
                    Height: 0,
                    Width : 0
                )
            )
        }
    }
}
