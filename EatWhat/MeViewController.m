//
//  MeViewController.m
//  EatWhat
//
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "MeViewController.h"

@implementation MeViewController

#pragma mark -视图加载后
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

#pragma mark -视图将要加载时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = self.title;
}



@end
