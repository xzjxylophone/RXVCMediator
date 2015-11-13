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
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        [nc presentViewController:nc animated:animate completion:nil];
        return YES;
    } else {
        NSLog(@"present String:(%@) is nil", str);
        return NO;
    }
}




@end
