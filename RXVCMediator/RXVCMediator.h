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




@end
