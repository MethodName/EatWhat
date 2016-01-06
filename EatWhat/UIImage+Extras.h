//
//  UIImage+Extras.h
//  HaoShiDai
//
//  Created by 沈佳 on 14-12-18.
//  Copyright (c) 2014年 shenjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extras)

//将图片按比例缩放
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

//将图片缩放到指定大小
-(UIImage*)scaleToSize:(CGSize)size;

@end
