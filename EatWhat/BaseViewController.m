//
//  BaseViewController.m
//  EatWhat
//  【基础控制器】
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "BaseViewController.h"
#import "NZAlertView.h"
#import "UIImage+Extras.h"
#import "YRActivityIndicator/YRActivityIndicator.h"




@interface BaseViewController ()

/**
 *  加载动画视图
 */
@property(nonatomic,strong)YRActivityIndicator *activityIndicator;

/**
 *  状态栏底部View
 */
@property(nonatomic,strong)UIView *statusView;


@end

@implementation BaseViewController

#pragma mark -视图加载后
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.title;
    
    
    //自定义返回按钮
//     UIImage *backButtonImage = [[UIImage imageNamed:@"icon-fanhui"] resizableImageWithCapInsets:UIEdgeInsetsMake(9, 9 ,9, 9)];
//     [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //backBarButton需要单独设置背景效果。只能在ios6.0以后才能用
    
    [self.navigationController.navigationBar lt_setBackgroundColor:THEME_COLORA(0.0)];
   
   
}

#pragma mark -视图将要显示时
-(void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
     [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[self.navigationController.navigationBar lt_reset];
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

#pragma mark -tabBar选择后图片重新渲染
-(void)setTabBarImage:(NSString*)image SelectedImage:(NSString*)selectedImage
{
    //未选中图片
    UIImage *img =[UIImage imageNamed:image];
    // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
    img= [img imageWithRenderingMode:UIImageRenderingModeAutomatic];
    [self.tabBarItem setImage:[img scaleToSize:CGSizeMake(25, 25)]];
    
    
    //选中图片
    UIImage *selectedImg =[UIImage imageNamed:selectedImage];
    // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
    selectedImg= [selectedImg imageWithRenderingMode:UIImageRenderingModeAutomatic];
    [self.tabBarItem setSelectedImage:[selectedImg scaleToSize:CGSizeMake(25, 25)] ];
    
}


#pragma mark -开始加载动画
-(void)startLoading
{
    [self.activityIndicator startAnimating];
    [self.view setUserInteractionEnabled:NO];
}

#pragma mark -停止加载动画
-(void)stopLoading
{
    [self.activityIndicator stopAnimating];
    [self.view setUserInteractionEnabled:YES];
}


#pragma mark -加载动画视图懒加载
-(YRActivityIndicator *)activityIndicator
{
    if (_activityIndicator == nil)
    {
        _activityIndicator = [[YRActivityIndicator alloc]initWithFrame:CGRectMake(0, 0, DV_W*0.2, DV_W*0.2)];
        [_activityIndicator setCenter:self.view.center];
        _activityIndicator.itemColor = THEME_COLORA(1.0);
        [self.view addSubview:_activityIndicator];
    }
    return _activityIndicator;
}

#pragma mark -添加状态栏底部视图
-(void)addStatusView
{
    if (_statusView == nil)
    {
        _statusView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0, DV_W, 20)];
        [_statusView setBackgroundColor:THEME_COLORA(1.0)];
        
        [self.view addSubview:_statusView];
    }
    else
    {
        [_statusView setHidden:NO];
    }
}

#pragma mark -隐藏状态栏底部视图
-(void)hideStatusView
{
    if (_statusView)
    {
        [_statusView setHidden:YES];
    }
}




@end
