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
#import "JPEngine.h"
#import "AFNetworking.h"

@interface AppDelegate ()

@end
// Library/Caches
#define FilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil])
@implementation AppDelegate




#pragma mark -加载配置
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    
    //[self HSDevaluateScript];
    return YES;
}




//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"icon-fanhui"]
//                                                      forState:0
//                                                    barMetrics:UIBarMetricsDefault];
//
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"icon-fanhui"]
//                                                      forState:1
//                                                    barMetrics:UIBarMetricsDefault];

// [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(9, 9) forBarMetrics:UIBarMetricsDefault];

//将返回按钮的文字position设置不在屏幕上显示
//[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];



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
     //[self loadJSPatch];
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





#pragma mark -这里拯救世界
/**
 *  下载JSPatch
 */
-(void)loadJSPatch
{
    //使用AFNetWork下载在服务器的js文件
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString *filePatch = [NSString stringWithFormat:@"http://192.168.1.252:8011/Download/Haoshidai/%@/Patch.js",[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]];
    NSLog(@"下载地址为：%@",filePatch);
    NSURL *URL = [NSURL URLWithString:filePatch];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response)
          {
              NSURL *documentsDirectoryURL = FilePath;
             NSFileManager *fileMgr = [NSFileManager defaultManager];
              //如果有存在这个文件【删除】
              if([fileMgr fileExistsAtPath:[documentsDirectoryURL.path  stringByAppendingString:@"/Patch.js"]])
              {
                  //删除这个文件
                  if([fileMgr removeItemAtPath:[documentsDirectoryURL.path  stringByAppendingString:@"/Patch.js"] error:nil])
                  {
                      NSLog(@"删除文件成功~");
                  }
                  else
                  {
                      NSLog(@"删除失败~~~");
                  }
              }
              else
              {
                  NSLog(@"还没有文件");
              }
            
              //保存到本地 Library/Caches目录下
              return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
          }
            completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error)
          {
              NSLog(@"File downloaded to: %@  \n error%@", filePath,error.description);
         }];
    [downloadTask resume];
  
}

/**
 *  运行下载的JS文件
 */
-(void)HSDevaluateScript
{
    NSString *dpath = FilePath.path;
     //获取内容
    NSString *js = [NSString stringWithContentsOfFile:[dpath  stringByAppendingString:@"/Patch.js"] encoding:NSUTF8StringEncoding error:nil];
   
    //如果有内容
    if (js.length > 0)
    {
        //-------
        //在此处解密js内容
        //----
        NSLog(@"\n____________________________\n%@\n____________________________\n",js);
        
        //运行
        [JPEngine startEngine];
        [JPEngine evaluateScript:js];
    }

}






@end
