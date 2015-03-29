//
//  main.swift
//  Pumpkin
//
//  Created by dimbow. on 2/5/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

import SpriteKit


public class PKImageSet{
    var name:String!;
    var filterType = SKTextureFilteringMode.Linear;
    
    public init(fileName:String){
        name = fileName;
    }
}

extension PKImageSet{
    public func fetchImageSize()->(Height:CGFloat,Width:CGFloat){
        var sz:[CGFloat] = [0,0];
        if(name != "" && name != nil){
            let node = SKSpriteNode(imageNamed: name!);
            sz = [node.size.height,node.size.width];
        }
        return(sz[0],sz[1]);
    }

    public func fitToViewer()->CGFloat{
        let sz = fetchImageSize();
        let h = UIScreen.mainScreen().bounds.size.height/sz.Height;
        let w = UIScreen.mainScreen().bounds.size.width/sz.Width;
        var res:CGFloat = 1.0;
        
        if(h<w){
            res = h;
        }else{
            res = w;
        }
        
        // 画面サイズより画像が小さかったら等倍以上にする
        if(sz.Height<UIScreen.mainScreen().bounds.size.height || sz.Width < UIScreen.mainScreen().bounds.size.width){
            res = 1+(1-res);
        }
        
        return CGFloat(res);
    }
}

public func PKFetchMinMax(sizearr:Array<CGFloat>,scale:CGFloat=1.0)->(Min:CGFloat,Max:CGFloat){
    var smin = sizearr[0];
    var smax = sizearr[0];
    for(var i=0;i<sizearr.count;i++){
        if(sizearr[i] > smax){
            smax = sizearr[i];
        }else if(sizearr[i] < smin){
            smin = sizearr[i];
        }
    }
    return(smin*scale,smax*scale)
}