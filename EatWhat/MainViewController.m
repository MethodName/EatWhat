//
//  MainViewController.m
//  EatWhat
//  【主页】
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

#pragma mark -视图加载后
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self createView];
    [self reachNetwork];
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
    [mainScrollView setPagingEnabled:YES];
    [self.view addSubview:mainScrollView];
    [mainScrollView setContentSize:CGSizeMake(DV_W*3, DV_H*3)];
    [mainScrollView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
    }];
    
    
   
    
    
    
}


#pragma mark -加载数据
-(void)loadData
{
    //AFJSONRequestSerializer *request = [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];
    
    
    
}



@end
