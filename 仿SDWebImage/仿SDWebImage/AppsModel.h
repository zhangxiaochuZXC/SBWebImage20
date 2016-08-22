//
//  AppsModel.h
//  01-列表异步下载网络图片
//
//  Created by HM on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppsModel : NSObject

/// APP名称
@property (copy, nonatomic) NSString *name;
/// APP下载量
@property (copy, nonatomic) NSString *download;
/// APP图标
@property (copy, nonatomic) NSString *icon;

/**
 *  提供给外界快速实现字典转模型的方法
 *
 *  @param dict 外界传入的字典
 *
 *  @return 返回模型对象
 */
+ (instancetype)appWithDict:(NSDictionary *)dict;

@end

/*
 {
 "name" : "植物大战僵尸",
 "download" : "10311万",
 "icon" : "http:\/\/p16.qhimg.com\/dr\/48_48_\/t0125e8d438ae9d2fbb.png"
 },
 */
