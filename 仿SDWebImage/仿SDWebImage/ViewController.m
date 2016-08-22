//
//  ViewController.m
//  仿SDWebImage
//
//  Created by HM on 16/8/20.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "AppsModel.h"
#import "UIImageView+SBWebCache.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController {
    
    /// 数据源数组
    NSArray *_appsList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadJsonData];
}

// 测试框架是否有效
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取随机数
    int random = arc4random_uniform((u_int32_t)_appsList.count);
    // 随机取出模型
    AppsModel *app = _appsList[random];

    // 分类接管图片的下载和展示
    [self.iconImageView SB_setimageWithURLString:app.icon];
}

// 这个 `loadJsonData`方法执行完了之后,我们再去点击屏幕
// loadJsonData是辅助我们开发框架!是测试框架的数据来源!
/// 下载json数据
- (void)loadJsonData
{
    // 1. 创建网络请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // json数据的地址
    NSString *URLString = @"https://raw.githubusercontent.com/zhangxiaochuZXC/ServerFile20/master/apps.json";
    
    // 2. 网络请求管理者发送GET请求,获取json数据;
    // 默认是异步执行的,回调默认是主线程
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *responseObject) {
        
        NSLog(@"%@",responseObject);
        
        // 定义临时的可变的数组
        NSMutableArray *tmpM = [NSMutableArray arrayWithCapacity:responseObject.count];
        
        // 下一步 : 拿着字典数组responseObject,实现字典转模型
        [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            // obj : 就是数组里的元素(字典)
            AppsModel *app = [AppsModel appWithDict:obj];
            
            // 把模型对象添加到可变数组
            [tmpM addObject:app];
        }];
        
        // 给数据源数组赋值
        _appsList = tmpM.copy;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
