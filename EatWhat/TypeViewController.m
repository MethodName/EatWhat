//
//  TypeViewController.m
//  EatWhat
//
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "TypeViewController.h"

@implementation TypeViewController

#pragma mark -视图加载后
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showErrorMessage:@"Created by Bruno Furtado on 18/12/13.Copyright (c) 2013 No Zebra Network. All rights reserved.Created by 唐明明 on 15/12/17.Copyright © 2015年 唐明明. All rights reserved."];
}



#pragma mark -视图将要加载时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = self.title;
}

@end
