//
//  RXVCMediator.h
//  RXVCMediatorExample
//
//  Created by Rush.D.Xzj on 15/11/12.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RXVCMediator : NSObject


+ (UIViewController *)viewControllerWithString:(NSString *)string query:(NSDictionary *)query;


+ (BOOL)pushInNavigationController:(UINavigationController *)nc withString:(NSString *)str query:(NSDictionary *)query animate:(BOOL)animate;


+ (BOOL)presentInNavigationController:(UINavigationController *)nc withString:(NSString *)str query:(NSDictionary *)query animate:(BOOL)animate completion:(void (^)(void))completion;



// 返回最近的一个VC
+ (BOOL)popToNearestInNavigationController:(UINavigationController *)nc withString:(NSString *)str animate:(BOOL)animate;
// 返回最远的一个VC
+ (BOOL)popToFarthestInNavigationController:(UINavigationController *)nc withString:(NSString *)str animate:(BOOL)animate;


// 返回最近（最远）的一个有效的VC
/* 一个界面有可能有多个来源
例如 A-B-C-D-E
 A-C-D-E
 A-D-E
 A-E
 A-B-E
 
 如果有效的返回上一个VC，且是最近(最远)的一个vc
 */

+ (BOOL)popToNearestInNavigationController:(UINavigationController *)nc vcClassStringArray:(NSArray *)vcClassStringArray animate:(BOOL)animate;
+ (BOOL)popToFarthestInNavigationController:(UINavigationController *)nc vcClassStringArray:(NSArray *)vcClassStringArray animate:(BOOL)animate;




@end
