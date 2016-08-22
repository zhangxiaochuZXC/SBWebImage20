//
//  UIImageView+SBWebCache.h
//  仿SDWebImage
//
//  Created by HM on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 1.分类可以拓展方法吗? 可以!
 2.分类可以拓展属性吗? 可以!
    属性的值都存储在带下划线的成员变量里头
 
 3.分类可以拓展成员变量吗? 不可以!
 4.分类为什么不可以拓展成员变量?
    如果给分类拓展成员变量,那么在开辟内存空间时,实际需要的内存空间大于系统规定的内存空间;
*/
@interface UIImageView (SBWebCache)
//{
//    int _num;
//}

@property (copy, nonatomic) NSString *lastURLString;

@end
