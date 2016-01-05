//
//  AppDelegate.m
//  EatWhat
//
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "AppDelegate.h"
#import "Define.h"
#import "NotificationName.h"
#import "NavigationController.h"
#import "TabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark -加载配置
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"icon-fanhui"]
                                                      forState:0
                                                    barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"icon-fanhui"]
                                                      forState:1
                                                    barMetrics:UIBarMetricsDefault];
    
   // [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(9, 9) forBarMetrics:UIBarMetricsDefault];
    
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    return YES;
}







#pragma mark -程序将要挂起时
- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

#pragma mark -程序被推送到后台的时
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

#pragma mark -程序从后台将要重新回到前台时
- (void)applicationWillEnterForeground:(UIApplication *)application
{
   
}

#pragma mark -应用程序进入活动状态
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}
#pragma mark -程序关闭时
- (void)applicationWillTerminate:(UIApplication *)application
{
    
}


#pragma mark =================【3D Touch快捷响应】======================
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
  completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    if ([shortcutItem.localizedTitle isEqualToString:@"分享一下"])
    {
        NavigationController *nv =   (NavigationController *)self.window.rootViewController;
        if ([nv.topViewController isKindOfClass:[UITabBarController class]])
        {
            TabBarController *tab =  (TabBarController *)nv.topViewController;
            tab.selectedIndex = 2;
            [nv pushViewController:[UIViewController new] animated:YES];
//            UIImagePickerController *pickerView = [UIImagePickerController new];
//            pickerView.sourceType = UIImagePickerControllerSourceTypeCamera;
//            [tab.viewControllers[2] showDetailViewController:pickerView sender:nil];
        }
    }
    else
    {
        
    }
    
}


@end
