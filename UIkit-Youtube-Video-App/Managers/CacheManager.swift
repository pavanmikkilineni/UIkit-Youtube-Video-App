//
//  CacheManager.swift
//  UIkit-Youtube-Video-App
//
//  Created by Pavan Mikkilineni on 10/12/21.
//

import Foundation

class CacheManager{
    
    static var shared = CacheManager()
    private var thumbnails = NSCache<NSString,NSData>()
    
    func setThumbnailCache(thumbnailUrl:String,data:Data){
        self.thumbnails.setObject(data as NSData, forKey: thumbnailUrl as NSString)
    }
    
    func getThumbnailCache(thumbnailUrl:String) -> Data?{
        return self.thumbnails.object(forKey: thumbnailUrl as NSString) as Data?
    }
    
}
