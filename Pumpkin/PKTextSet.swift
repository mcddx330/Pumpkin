//
//  PKTextSet.swift
//  Pumpkin
//
//  Created by dimbow. on 2/5/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import SpriteKit


open class PKTextSet{
    var PKtext:NSString!;
    
    public init(text:NSString){
        PKtext = text;
    }


    public func checkMultiLineText(_ checkString:String)->(Result:Bool, Lines:Array<String>) {
        let sepcnt = checkString.characters.count; // 識別文字の文字数カウント ("/"や"\n"を考慮して)
        var isMultiLine:Bool = false; // マルチラインか否か？
        var txt = PKtext as String; // 編集済文字列用
        var MultiLine:[String] = []; // 複数行用配列
        
        whl:while(true){
            let chktxt = txt as NSString; // NSRange用
            let chk:NSRange = chktxt.range(of: checkString,  options: NSString.CompareOptions.caseInsensitive);
            if(chk.length != 0){
              // 文字列抽出
              isMultiLine = true;
              var pos = txt.characters.index(txt.endIndex,  offsetBy: chk.location);
              MultiLine.append(txt.substring(to: pos));

              // 抽出した分+識別文字までを削除
              pos = txt.characters.index(txt.startIndex,  offsetBy: chk.location + sepcnt);
              txt.removeSubrange(txt.startIndex..<pos);
            } else {
                if(isMultiLine == true){
                    MultiLine.append(chktxt as String);
                    isMultiLine = false;
                }
                break whl;
            }
        }
        
        if (MultiLine.count != 0) {
            isMultiLine = true;
        }

        return (isMultiLine, MultiLine);
    }
}
