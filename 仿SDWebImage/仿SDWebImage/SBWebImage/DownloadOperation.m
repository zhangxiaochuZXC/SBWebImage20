//
//  DownloadOperation.m
//  仿SDWebImage
//
//  Created by HM on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "DownloadOperation.h"

@interface DownloadOperation ()

/// 接收控制器传入的图片地址
@property (copy, nonatomic) NSString *URLString;

/// 接收控制器传入的下载完成的回调
@property (copy, nonatomic) void(^finishedBlock)(UIImage *image);

@end

@implementation DownloadOperation

/*
 1.自定义DownloadOperation的目的 : 下载图片
    1.1 图片的地址
    1.2 传递图片到VC
 
 2.重写自定义操作的入口方法
 3.任何操作在执行时都会默认的调用这个方法
 4.默认就是在子线程执行的
 5.当队列调度操作执行时,才会进入这个mian方法
 */
- (void)main
{
    // 不能再main方法一开始就做状态是否被取消的判断
    // 因为 : 有可能操作已经把在执行了,但是取消消息还没有发送过来!
    // 一般会在延迟操作的后面做判断,但是也可以在多个地方做多次判断
//    if (self.isCancelled) {
//        NSLog(@"取消 %@",self.URLString);
//        return;
//    }
    
    NSLog(@"传入 %@",self.URLString);
    
    // 模拟延迟
    [NSThread sleepForTimeInterval:1.0];
    
    // 下载图片
    NSURL *URL = [NSURL URLWithString:self.URLString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    UIImage *image = [UIImage imageWithData:data];
    
    if (self.isCancelled) {
        NSLog(@"取消 %@",self.URLString);
        return;
    }
    
    // 断言 : 保证某一个条件一定满足,如果不满足就崩溃,并且自定义崩溃信息;是C语言开发者的最爱;
    // 只在开发时有效!方便多人开发的;
    NSAssert(self.finishedBlock != nil, @"下载完成的回调不能为空!");
    
    // 图片下载完成之后,需要把图片传递到VC
//    if (self.finishedBlock != nil) {
        // 需要在主线程,把图片对象传递到控制器
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"完成 %@",self.URLString);
            self.finishedBlock(image);
        }];
//    }
}

// 图片下载的主方法 : 这个方法执行完才执行main,现有操作,再有main
+ (instancetype)downloadWithURLString:(NSString *)URLString finishedBlock:(void (^)(UIImage *))finishedBlock
{
    // 创建自定义操作
    DownloadOperation *op = [[self alloc] init];
    
    // 记录外界传入的图片地址和下载完成的回调
    op.URLString = URLString;
    op.finishedBlock = finishedBlock;
    
    // 返回自定义操作
    return op;
}

@end
