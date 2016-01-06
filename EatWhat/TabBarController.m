//
//  TabBarController.m
//  EatWhat
//
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#import "TabBarController.h"
#import "Define.h"
#import "UIImage+Extras.h"

@interface TabBarController ()

@end

@implementation TabBarController

#pragma mark -视图加载后
- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置主题颜色
    [self.tabBar setTintColor:THEME_COLORA(1.0)];

    for (UITabBarItem *item in self.tabBar.items)
    {
        item.image = [item.image scaleToSize:CGSizeMake(25, 25)];
    }




}




@end
