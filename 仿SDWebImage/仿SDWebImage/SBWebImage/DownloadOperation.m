//
//  DownloadOperation.m
//  仿SDWebImage
//
//  Created by HM on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "DownloadOperation.h"

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
    NSLog(@"传入 %@",self.URLString);
    
    // 下载图片
    NSURL *URL = [NSURL URLWithString:self.URLString];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    UIImage *image = [UIImage imageWithData:data];
    
    // 图片下载完成之后,需要把图片传递到VC
    if (self.finishedBlock != nil) {
        // 需要在主线程,把图片对象传递到控制器
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.finishedBlock(image);
        }];
    }
}

@end
