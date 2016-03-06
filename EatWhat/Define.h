//
//  Define.h
//  EatWhat
//
//  Created by 唐明明 on 15/12/17.
//  Copyright © 2015年 唐明明. All rights reserved.
//

#ifndef Define_h
#define Define_h

//获取屏幕 宽度、高度
#define DV_W ([UIScreen mainScreen].bounds.size.width)
#define DV_H ([UIScreen mainScreen].bounds.size.height)

//打印当前方法的名称
#define PRINT_METHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)



//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断设备的操做系统是不是ios7
#define IOS7 ([[[UIDevice currentDevice].systemVersion doubleValue] >= 7.0]

//判断设备的操做系统是不是ios8
#define IOS8 ([[[UIDevice currentDevice].systemVersion doubleValue] >= 8.0]

//判断设备的操做系统是不是ios9
#define IOS9 ([[[UIDevice currentDevice].systemVersion doubleValue] >= 9.0]

//判断当前设备是不是iPhone4或者4s
#define IPHONE4S    (([[UIScreen mainScreen] bounds].size.height)==480)

//判断当前设备是不是iPhone5
#define IPHONE5    (([[UIScreen mainScreen] bounds].size.height)==568)

//判断当前设备是不是iPhone6
#define IPHONE6    (([[UIScreen mainScreen] bounds].size.height)==667)

//判断当前设备是不是iPhone6Plus
#define IPHONE6_PLUS    (([[UIScreen mainScreen] bounds].size.height)>=736)

//获取当前屏幕的高度
#define kMainScreenHeight ([UIScreen mainScreen].applicationFrame.size.height)

//获取当前屏幕的宽度
#define kMainScreenWidth  ([UIScreen mainScreen].applicationFrame.size.width)



//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif



//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define THEME_COLORA(a) RGBA(235, 79, 56,a)


//方正黑体简体字体定义
#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
//G-C-D主线程
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

//延迟GCD时间
#define DisTime(time)  dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC)
//延迟GCD
#define DisBACK(disTime,block) dispatch_after(disTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){dispatch_async(dispatch_get_main_queue(), block);});


//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)


//打印当前方法的名称
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)




#endif /* Define_h */
