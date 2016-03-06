//
//  MainViewController.m
//  EatWhat
//  【主页】
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "MainViewController.h"
#import <objc/runtime.h>


@interface MainViewController()<UIWebViewDelegate>

#pragma mark ================类，属性声明================
@property(nonatomic,weak)UIWebView *webView;


@end

#pragma mark ================定义些宏================

#define BarHeight (DV_W*0.56-20)


#pragma mark ================VC生命周期================

@implementation MainViewController



-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTabBarImage:@"tab_home" SelectedImage:@"tab_home_hover"];
    [self createView];
    
    [self reachNetwork];
    NSURLRequest *requst = [[NSURLRequest alloc]initWithURL:[[NSURL alloc] initWithString:@"http://blog.methodname.com"]];
    [self.webView loadRequest:requst];
    [self.webView setDelegate:self];
   // [self startLoading];
    [self.webView.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}






/**
 *  视图将要加载时
 *
 *  @param animated
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"";
    
//    //GCD延迟0.5秒执行执行
//    DisBACK(DisTime(0.5f),^
//    {
//        //这里的代码延迟在主线程中执行
//        [TMMAnimation scaleAnime:self.mainScrollView FromValue:0.0 ToValue:1.0 Duration:0.25 Autoreverse:NO RepeatCount:1 Object:self IsFillMode:YES Key:@"mainScrollView_scale"];
//    });

   
}

/**
 *  视图加载后
 *
 *  @param animated
 */
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


#pragma mark -网页加载完成后
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
   // [self stopLoading];
    //unsigned int count = 0;
    //Ivar *ivar = class_copyIvarList([self.webView class], &count);
    
    
}





#pragma mark ================动画监听================
/**
 *  动画开始执行
 *
 *  @param anim
 */
-(void)animationDidStart:(CAAnimation *)anim
{
    //[self.webView setHidden:NO];
}

/**
 *  动画执行完成
 *
 *  @param anim 执行动画对象
 *  @param flag 是否完成或删除
 */
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //anim：完成或者被删除的动画实例
    //flag：标志该动画是执行完成或者被删除：YES：执行完成；NO：被删除
//    if (flag) {
//        //anim.delegate = nil;
//        //[self.mainScrollView.layer removeAnimationForKey:@"mainScrollView_scale"];
//        [self startLoading];
//    }
}




#pragma mark -================手写代码一千行无BUG================
/**
 *  创建视图
 */
-(void)createView
{
    UIWebView *webView = [[UIWebView alloc]init];
    [webView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:webView];
    [webView.scrollView setBounces:YES];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.mas_equalTo(CGSizeMake(DV_W, DV_H-44));
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view);
    }];
    self.webView = webView;
    
    
   
    
    
    
}


/**
 *  KVO监听响应事件
 *
 *  @param keyPath 监听值属性
 *  @param object  监听对象
 *  @param change  值变化字典
 *  @param context
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (object == self.webView.scrollView &&[keyPath isEqualToString:@"contentOffset"])
    {
         CGFloat offsetY = self.webView.scrollView.contentOffset.y;
        if (offsetY<=BarHeight)
        {
            //CGFloat alpha = 1 - (offsetY/BarHeight);
            [self hideStatusView];
        }
        else
        {
            [self addStatusView];
        }
        
    }
}









@end
