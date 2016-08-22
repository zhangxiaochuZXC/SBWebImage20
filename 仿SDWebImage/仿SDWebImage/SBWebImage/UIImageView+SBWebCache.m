//
//  UIImageView+SBWebCache.m
//  仿SDWebImage
//
//  Created by HM on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "UIImageView+SBWebCache.h"
#import <objc/runtime.h>

@implementation UIImageView (SBWebCache)

/*
 运行时机制 : 是开发OC的;即,OC就是对运行时的封装;是C语言的API;
 交换方法 : 使两个方法的地址互调
 动态的获取对象的属性或者成员变量 (字典转模型的第三方框架)
 动态的给属性或者成员变量赋值
 关联对象 : 使分类的属性,跟分类建立关心,动态的给分类的属性赋值
 */

- (void)setLastURLString:(NSString *)lastURLString
{
    /*
     参数1 : 要关联的对象
     参数2 : 关联的key
     参数3 : 关联的值 (value)
     参数4 : 关联的值得存储策略
     */
    objc_setAssociatedObject(self, "key", lastURLString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)lastURLString
{
    /*
     参数1 : 要关联的对象
     参数2 : 关联的key
     */
    return objc_getAssociatedObject(self, "key");
}

- (void)SB_setimageWithURLString:(NSString *)URLString
{
    // 从随机模型里面,取出图片,去下载
    if (![URLString isEqualToString:self.lastURLString] && self.lastURLString != nil) {
        
        // 单例接管取消操作
        [[DownloaderManager sharedManager] cancelWithLastURLString:self.lastURLString];
    }
    
    self.lastURLString = URLString;
    
    // 单例接管下载操作
    [[DownloaderManager sharedManager] downloadWithURLString:URLString finishedBlock:^(UIImage *image) {
        self.image = image;
    }];
}

@end
