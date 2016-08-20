//
//  ViewController.m
//  仿SDWebImage
//
//  Created by HM on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "DownloadOperation.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    /// 全局队列
    NSOperationQueue *_queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 实例化队列
    _queue = [[NSOperationQueue alloc] init];
    
    NSString *URLString = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
    
    // 创建操作的同时传入图片地址和下载完成的回调
    DownloadOperation *op = [DownloadOperation downloadWithURLString:URLString finishedBlock:^(UIImage *image) {
        // 赋值操作 (主线程)
        NSLog(@"%@ %@",image,[NSThread currentThread]);
    }];
    
    /*
    void (^finishedBlock)(UIImage *) = ^(UIImage *image) {
        // 赋值操作 (主线程)
    };
    // 类方法实例化自定义操作
    DownloadOperation *op = [DownloadOperation downloadWithURLString:URLString finishedBlock:finishedBlock];
     */
    
    // 把自定义操作添加到队列
    [_queue addOperation:op];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)demo
{
    // 实例化队列
    _queue = [[NSOperationQueue alloc] init];
    
    // 实例化自定义操作
    DownloadOperation *op = [[DownloadOperation alloc] init];
    
    // 向自定义操作内部传入图片地址
//    op.URLString = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
    
    // 传入代码块到自定义操作对象
//    [op setFinishedBlock:^(UIImage *image) {
//        // 赋值操作 (主线程)
//        NSLog(@"%@ %@",image,[NSThread currentThread]);
//    }];
    
    /*
     // 先定义等待执行的代码块
     void (^finishedBlock)(UIImage *) = ^(UIImage *image) {
     // 赋值操作 (主线程)
     };
     // 传入代码块
     op.finishedBlock = finishedBlock;
     */
    
    // 把自定义操作添加到队列
    [_queue addOperation:op];
}

@end
