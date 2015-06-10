//
//  PKTextSet.swift
//  Pumpkin
//
//  Created by dimbow. on 2/5/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import SpriteKit


public class PKTextSet{
    var PKtext:NSString!;
    
    public init(text:NSString){
        PKtext = text;
    }
}

extension PKTextSet{
    public func checkMultiLineText(checkString:String)->(Result:Bool,Lines:Array<String>){
        let sepcnt = checkString.characters.count; // 識別文字の文字数カウント ("/"や"\n"を考慮して)
        var isMultiLine:Bool = false; // マルチラインか否か？
        var txt = PKtext as String; // 編集済文字列用
        var MultiLine:[String] = []; // 複数行用配列
        
        whl:while(true){
            let chktxt = txt as NSString; // NSRange用
            let chk:NSRange = chktxt.rangeOfString(checkString, options: NSStringCompareOptions.CaseInsensitiveSearch);
            if(chk.length != 0){
                // 文字列抽出
                isMultiLine = true;
                var pos = advance(txt.startIndex, chk.location);
                MultiLine.append(txt.substringToIndex(pos));
                
                // 抽出した分+識別文字までを削除
                pos = advance(txt.startIndex,chk.location+sepcnt);
                txt.removeRange(txt.startIndex..<pos);
            }else{
                if(isMultiLine == true){
                    MultiLine.append(chktxt as String);
                    isMultiLine = false;
                }
                break whl;
            }
        }
        
        if(MultiLine.count != 0){
            isMultiLine = true;
        }
        return (isMultiLine,MultiLine);
    }
}