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
    NSLog(@"main %@",[NSThread currentThread]);
    
    // 下一步是在这里面做图片下载的事情,然后传递到VC
}

@end
