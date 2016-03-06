//
//  BaseViewController.h
//  EatWhat
//
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
#import "Masonry.h"
#import "AFNetworking/AFNetworking.h"
#import "UINavigationBar+Awesome.h"
#import "TMMAnimation.h"
#import "JPEngine.h"



@interface BaseViewController : UIViewController


#pragma mark ================测试网络================
/**
 *  检测网络连接
 */
- (void)reachNetwork;


#pragma mark ================显示弹窗消息================
/**
 *  显示警告消息
 *
 *  @param msg 消息内容
 */
-(void) showInfoMessage:(NSString*)msg;

/**
 *  显示成功消息
 *
 *  @param msg 消息内容
 */
-(void) showSuccessMessage:(NSString*)msg;

/**
 *  显示错误消息
 *
 *  @param msg 消息内容
 */
-(void) showErrorMessage:(NSString*)msg;


#pragma mark ================加载动画================
/**
 *  开始加载动画
 */
-(void)startLoading;

/**
 *  停止加载动画
 */
-(void)stopLoading;



#pragma mark ================状态栏底部视图================

/**
 *  添加状态栏底部视图
 */
-(void)addStatusView;

/**
 *  隐藏状态栏底部视图
 */
-(void)hideStatusView;


#pragma mark -现在tabBar的图片时
-(void)setTabBarImage:(NSString*)image SelectedImage:(NSString*)selectedImage;



@end
