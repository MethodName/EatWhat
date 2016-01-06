//
//  MeViewController.m
//  EatWhat
//
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController()

@property(nonatomic,weak)UIScrollView *mainScrollView;

@end

@implementation MeViewController

#define BarHeight 64

#pragma mark -视图加载后
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTabBarImage:@"tab_user" SelectedImage:@"tab_user_hover"];
    [self createView];
    [self.mainScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [self startLoading];
}

#pragma mark -视图将要加载时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = self.title;
}



#pragma mark -创建视图
-(void)createView
{
    UIScrollView *mainScrollView = [UIScrollView new];
    [mainScrollView setBackgroundColor:[UIColor whiteColor]];
    // [mainScrollView setPagingEnabled:YES];
    [self.view addSubview:mainScrollView];
    [mainScrollView setBounces:NO];
    [mainScrollView setContentSize:CGSizeMake(DV_W, (DV_H-108)*3)];
    [mainScrollView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.size.mas_equalTo(CGSizeMake(DV_W, DV_H-44));
         make.top.equalTo(self.view.mas_top);
         make.left.equalTo(self.view);
     }];
    self.mainScrollView = mainScrollView;
    
    UIImageView *image = [UIImageView new];
    [image setImage:[UIImage imageNamed:@"bgimage1"]];
    [mainScrollView addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(DV_W, DV_W*1.32f));
        make.left.equalTo(mainScrollView);
        make.top.equalTo(mainScrollView);
    }];
    
    
    
    
    
}


#pragma mark -布局自动滚动
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (object == self.mainScrollView &&[keyPath isEqualToString:@"contentOffset"])
    {
        CGFloat offsetY = self.mainScrollView.contentOffset.y;
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
