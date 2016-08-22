//
//  NSString+path.h
//  01-列表异步下载网络图片
//
//  Created by HM on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//  专门获取沙盒文件缓存路径

#import <Foundation/Foundation.h>

@interface NSString (path)

/**
 *  获取cache文件目录
 *
 *  @return cache文件目录
 */
- (NSString *)appendCachesPath;

@end
