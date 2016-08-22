//
//  DownloadOperation.h
//  仿SDWebImage
//
//  Created by HM on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSString+path.h"

@interface DownloadOperation : NSOperation

/**
 *  类方法实例化自定义操作 : 在实例化自定义操作同时,传入图片地址和下载完成的回调
 *
 *  @param URLString     接收VC传入的图片地址
 *  @param finishedBlock 接收VC传入的下载完成的回调
 *
 *  @return 自定义下载操作对象
 */
+ (instancetype)downloadWithURLString:(NSString *)URLString finishedBlock:(void(^)(UIImage *image))finishedBlock;

@end
