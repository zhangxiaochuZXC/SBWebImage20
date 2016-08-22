//
//  DownloaderManager.h
//  仿SDWebImage
//
//  Created by HM on 16/8/22.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DownloadOperation.h"

@interface DownloaderManager : NSObject

+ (instancetype)sharedManager;

/// 提示 : 将将来开发中,只要是异步操作,就要定义代码块回调;

/**
 *  单例管理下载的主方法
 *
 *  @param URLString     单例接收控制器传入的图片地址
 *  @param finishedBlock 单例接收控制器传入的图片下载完成的回调,把图片回调VC
 */
- (void)downloadWithURLString:(NSString *)URLString finishedBlock:(void(^)(UIImage *image))finishedBlock;

/**
 *  单例管理取消操作
 *
 *  @param lastURLString 上一次正在执行的操作对应的图片地址
 */
- (void)cancelWithLastURLString:(NSString *)lastURLString;

@end
