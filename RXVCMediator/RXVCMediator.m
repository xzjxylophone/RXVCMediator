//
//  RXVCMediator.m
//  RXVCMediatorExample
//
//  Created by Rush.D.Xzj on 15/11/12.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXVCMediator.h"
#import "UIViewController+Mediator.h"
#import "RXVCMediatorHeader.h"


@implementation RXVCMediator




+ (UIViewController *)viewControllerWithString:(NSString *)string query:(NSDictionary *)query
{
    NSURL *url = [NSURL URLWithString:string];
    // 表示传递过来的不能得到URL
    // 可能有中文字符串的
    if (url == nil) {
        // 转换成utf8编码的
        NSString *uft8String = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        url = [NSURL URLWithString:uft8String];
    }
    // 还是不可以
    if (url == nil) {
        return nil;
    }
    NSString *scheme = url.scheme;
    NSString *host = url.host;
    
    Class cls = nil;
    // 本地跳转页面
    if ([scheme isEqualToString:RXVCMediator_Scheme]) {
        cls = NSClassFromString(host);
    } else {
        // 有可能将来是有其他的
    }
    if (cls == nil) {
        return nil;
    }
    UIViewController *result = [[cls alloc] init];
    result.rx_string = string;
    result.rx_query = query;
    return result;
}

+ (BOOL)pushInNavigationController:(UINavigationController *)nc withString:(NSString *)str query:(NSDictionary *)query animate:(BOOL)animate;
{
    UIViewController *vc = [self viewControllerWithString:str query:query];
    if (vc != nil) {
        [nc pushViewController:vc animated:animate];
        return YES;
    } else {
        NSLog(@"open String:(%@) is nil", str);
        return NO;
    }
}


+ (BOOL)presentInNavigationController:(UINavigationController *)nc withString:(NSString *)str query:(NSDictionary *)query animate:(BOOL)animate completion:(void (^)(void))completion;
{
    UIViewController *vc = [UIViewController rx_vcWithString:str query:query];
    if (vc != nil) {
        [nc presentViewController:vc animated:animate completion:completion];
        return YES;
    } else {
        NSLog(@"present String:(%@) is nil", str);
        return NO;
    }
}

+ (BOOL)testOK
{
    return true;
}




// 返回最近的一个VC
+ (BOOL)popToNearestInNavigationController:(UINavigationController *)nc withString:(NSString *)str animate:(BOOL)animate
{
    UIViewController *vc = [UIViewController rx_vcWithString:str query:nil];
    NSString *clsString = NSStringFromClass([vc class]);
    if (clsString.length == 0) {
        return NO;
    }
    return [self popToNearestInNavigationController:nc vcClassStringArray:@[clsString] animate:animate];
}

// 返回最远的一个VC
+ (BOOL)popToFarthestInNavigationController:(UINavigationController *)nc withString:(NSString *)str animate:(BOOL)animate
{
    UIViewController *vc = [UIViewController rx_vcWithString:str query:nil];
    NSString *clsString = NSStringFromClass([vc class]);
    if (clsString.length == 0) {
        return NO;
    }
    return [self popToFarthestInNavigationController:nc vcClassStringArray:@[clsString] animate:animate];
}
+ (BOOL)popToNearestInNavigationController:(UINavigationController *)nc vcClassStringArray:(NSArray *)vcClassStringArray animate:(BOOL)animate
{
    NSArray *vcArrays = nc.viewControllers;
    UIViewController *findVC = nil;
    for (NSInteger i = vcArrays.count - 1; i >= 0; i--) {
        UIViewController *tmpVC = vcArrays[i];
        NSString *tmpString = NSStringFromClass([tmpVC class]);
        for (NSString *vcClassString in vcClassStringArray) {
            // 找到最近匹配的一个
            if ([tmpString isEqualToString:vcClassString]) {
                findVC = tmpVC;
                // 跳出里面的循环
                break;
            }
        }
        
        if (findVC != nil) {
            // 跳出外面的循环
            break;
        }
    }
    if (findVC) {
        [nc popToViewController:findVC animated:animate];
    }
    return findVC != nil;
}

+ (BOOL)popToFarthestInNavigationController:(UINavigationController *)nc vcClassStringArray:(NSArray *)vcClassStringArray animate:(BOOL)animate
{
    NSArray *vcArrays = nc.viewControllers;
    
    UIViewController *findVC = nil;
    for (NSInteger i = 0; i < vcArrays.count; i++) {
        UIViewController *tmpVC = vcArrays[i];
        NSString *tmpString = NSStringFromClass([tmpVC class]);
        for (NSString *vcClassString in vcClassStringArray) {
            // 找到最近匹配的一个
            if ([tmpString isEqualToString:vcClassString]) {
                findVC = tmpVC;
                // 跳出里面的循环
                break;
            }
        }
        
        if (findVC != nil) {
            // 跳出外面的循环
            break;
        }
        
        
    }
    if (findVC) {
        [nc popToViewController:findVC animated:animate];
    }
    return findVC != nil;
}




























@end
