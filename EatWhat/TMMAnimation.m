//
//  TMMAnimation.m
//  EatWhat
//
//  Created by 唐明明 on 16/1/7.
//  Copyright © 2016年 唐明明. All rights reserved.
//

#import "TMMAnimation.h"

@implementation TMMAnimation

#define ANIMATION_SCALE_NUM 4.0f

#pragma mark -淡入淡出动画
+(void)animationFade:(UIView *)view WithDuration:(CFTimeInterval) duration
{
    CATransition* animation = [CATransition animation];
    [animation setDuration:duration];
    [animation setType:kCATransitionFade];
    [animation setSubtype:kCATransitionFromBottom];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [[view layer]addAnimation:animation forKey:nil];
    
}


#pragma mark -缩放动画
+(void)scaleAnime:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount
{
    CABasicAnimation *basicAnime=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [basicAnime setFromValue:[NSNumber numberWithFloat:fromVale]];
    [basicAnime setToValue:[NSNumber numberWithFloat:toVlaue]];
    [basicAnime setDuration:duration];
    [basicAnime setAutoreverses:autoreverses];
    [basicAnime setRepeatCount:repeatCount];
    basicAnime.fillMode=kCAFillModeForwards;
    basicAnime.removedOnCompletion = NO;
    [view.layer addAnimation:basicAnime forKey:@"scale"];
}


#pragma mark -缩放动画
/**
 *  缩放动画，有代理
 *
 *  @param view         执行视图
 *  @param fromVale     开始大小
 *  @param toVlaue      变化大小
 *  @param duration     动画时间
 *  @param autoreverses 是否动画还原执行
 *  @param repeatCount  重复次数
 *  @param object       代理对象
 *  @param isFillMode  是否保持最后动画形态
 *  @param key          动画key
 */
+(void)scaleAnime:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount Object:(id)object IsFillMode:(BOOL)isFillMode Key:(NSString *)key
{
    CABasicAnimation *basicAnime=[CABasicAnimation animationWithKeyPath:@"transform.scale"];//动画类型
    [basicAnime setFromValue:[NSNumber numberWithFloat:fromVale]];//起始大小
    [basicAnime setToValue:[NSNumber numberWithFloat:toVlaue]];//变化大小
    [basicAnime setDuration:duration];//动画时间
    [basicAnime setAutoreverses:autoreverses];//是否还原执行动画
    [basicAnime setRepeatCount:repeatCount];//重复次数
    if (isFillMode)//是否保持最后动画形态
    {
        basicAnime.fillMode=kCAFillModeForwards;
        basicAnime.removedOnCompletion = NO;
    }
    
    object!=nil?[basicAnime setDelegate:object]:nil;//设置代理
    
    [view.layer addAnimation:basicAnime forKey:key];//指定动画名字
}



#pragma mark -缩放动画透明
+(void)scaleOpacityAnime:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount
{
    CABasicAnimation *basicAnime=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [basicAnime setFromValue:[NSNumber numberWithFloat:fromVale]];
    [basicAnime setToValue:[NSNumber numberWithFloat:toVlaue]];
    [basicAnime setDuration:duration];
    [basicAnime setAutoreverses:autoreverses];
    [basicAnime setRepeatCount:repeatCount];
    [view.layer addAnimation:basicAnime forKey:@"scaleAnime"];
    
    CABasicAnimation *opacityAnime=[CABasicAnimation animationWithKeyPath:@"opacity"];
    [opacityAnime setFromValue:[NSNumber numberWithFloat:0.2]];
    [opacityAnime setToValue:[NSNumber numberWithFloat:1.0]];
    [opacityAnime setDuration:duration];
    [opacityAnime setAutoreverses:autoreverses];
    [opacityAnime setRepeatCount:repeatCount];
    [view.layer addAnimation:opacityAnime forKey:@"opacityAnime"];
    
}

#pragma mark -左右晃动
+(void)shakeLR:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount
{
    CABasicAnimation *basicAnime=[CABasicAnimation animationWithKeyPath:@"position.x"];
    [basicAnime setFromValue:[NSNumber numberWithFloat:fromVale]];
    [basicAnime setToValue:[NSNumber numberWithFloat:toVlaue]];
    [basicAnime setDuration:duration];
    [basicAnime setAutoreverses:autoreverses];
    [basicAnime setRepeatCount:repeatCount];
    [view.layer addAnimation:basicAnime forKey:@"shake"];
}

#pragma mark -上下晃动
+(void)shakeUD:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount
{
    CABasicAnimation *basicAnime=[CABasicAnimation animationWithKeyPath:@"position.y"];
    [basicAnime setFromValue:[NSNumber numberWithFloat:fromVale]];
    [basicAnime setToValue:[NSNumber numberWithFloat:toVlaue]];
    [basicAnime setDuration:duration];
    [basicAnime setAutoreverses:autoreverses];
    [basicAnime setRepeatCount:repeatCount];
    [view.layer addAnimation:basicAnime forKey:@"shake"];
}




#pragma mark -解决图片方向不对问题
+ (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


@end
