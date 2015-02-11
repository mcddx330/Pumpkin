//
//  PKFileManage.swift
//  Pumpkin
//
//  Created by dimbow. on 2/6/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import Foundation

public typealias PKSaveData = Dictionary<String,AnyObject>;
public class PKFileManage{
    private var domainPaths:NSArray!;
    private var docDir:NSString!;
    private var filePath:NSString!;
    private var fileData:NSData!;
    private var DestinationFileName:String = "DefaultGameData.plist";

    public var saveData = Dictionary<String,AnyObject>();
    
    
    public init(plistName:String?){
        if(plistName != nil){
            DestinationFileName = plistName!;
        }
        domainPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray;
        docDir = domainPaths!.objectAtIndex(0) as? NSString;
        filePath = docDir!.stringByAppendingPathComponent(DestinationFileName);
    }
}


extension PKFileManage {
    public func Save()->Bool{
        fileData = NSKeyedArchiver.archivedDataWithRootObject(saveData);
        return fileData.writeToFile(filePath as! String, atomically: true);
    }
    
    public func Load()->Dictionary<String,AnyObject>{
        let fileManager = NSFileManager.defaultManager();
        var res = Dictionary<String,AnyObject>();
        
        if(!fileManager.fileExistsAtPath(filePath! as! String)){
            res = ["false":false];
        }else{
            let rawData = NSData(contentsOfFile: filePath! as! String);
            res = NSKeyedUnarchiver.unarchiveObjectWithData(rawData!) as! Dictionary<String,AnyObject>;
        }
        return res;
    }
}
