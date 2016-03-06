//
//  TMMAnimation.h
//  EatWhat
//
//  Created by 唐明明 on 16/1/7.
//  Copyright © 2016年 唐明明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TMMAnimation : NSObject

#pragma mark -淡入淡出动画
+(void)animationFade:(UIView *)view WithDuration:(CFTimeInterval) duration;

#pragma mark -缩放动画
+(void)scaleAnime:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount;

#pragma mark -缩放动画，代理
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
+(void)scaleAnime:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount Object:(id)object IsFillMode:(BOOL)isFillMode Key:(NSString *)key;

#pragma mark -缩放动画透明
+(void)scaleOpacityAnime:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount;

#pragma mark -左右晃动
+(void)shakeLR:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount;
#pragma mark -上下晃动
+(void)shakeUD:(UIView *)view FromValue:(float)fromVale ToValue:(float)toVlaue Duration:(float)duration Autoreverse:(BOOL)autoreverses RepeatCount:(float)repeatCount;

+ (UIImage *)fixOrientation:(UIImage *)aImage;


@end
