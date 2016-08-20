//
//  DownloadOperation.h
//  仿SDWebImage
//
//  Created by HM on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloadOperation : NSOperation

/// 接收控制器传入的图片地址
@property (copy, nonatomic) NSString *URLString;

/// 接收控制器传入的下载完成的回调
@property (copy, nonatomic) void(^finishedBlock)(UIImage *image);

@end
