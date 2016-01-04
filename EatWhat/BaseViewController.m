//
//  BaseViewController.m
//  EatWhat
//  【基础控制器】
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "BaseViewController.h"
#import "NZAlertView.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark -视图加载后
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.title;
}


#pragma mark =====测试======
/**
 *  检测网络连接
 */
- (void)reachNetwork
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 移动蜂窝数据
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // Wifi
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                [self showInfoMessage:@"未知网络连接！"];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                [self showErrorMessage:@"当前无网络链接！"];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                [self showSuccessMessage:@"您正在使用移动蜂窝数据"];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                [self showSuccessMessage:@"您目前的网络环境为Wifi"];
            }
                break;
                
            default:
                break;
        }
    }];
}



#pragma mark -显示警告消息
-(void) showInfoMessage:(NSString*)msg
{
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleInfo title:@"提示" message:msg];
    [alert setTextAlignment:NSTextAlignmentCenter];
    [alert show];
}

#pragma mark -显示成功消息
-(void) showSuccessMessage:(NSString*)msg
{
     NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleSuccess title:@"提示" message:msg];
    [alert setTextAlignment:NSTextAlignmentCenter];
    [alert show];
}

#pragma mark -显示错误消息
-(void) showErrorMessage:(NSString*)msg
{
     NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError title:@"提示" message:msg];
    [alert setTextAlignment:NSTextAlignmentCenter];
    [alert show];
}






@end
