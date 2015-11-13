//
//  UIViewController+Mediator.m
//  RXVCMediatorExample
//
//  Created by Rush.D.Xzj on 15/11/12.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "UIViewController+Mediator.h"
#import <objc/runtime.h>
#import "RXVCMediatorHeader.h"


@implementation UIViewController (Mediator)

#pragma mark - Property
- (NSString *)rx_string
{
    return objc_getAssociatedObject(self, @"rx_string");
}

- (void)setRx_string:(NSString *)rx_string
{
    objc_setAssociatedObject(self, @"rx_string", rx_string, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)rx_query
{
    return objc_getAssociatedObject(self, @"rx_query");
}

- (void)setRx_query:(NSDictionary *)rx_query
{
    objc_setAssociatedObject(self, @"rx_query", rx_query, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)rx_params
{
    return objc_getAssociatedObject(self, @"rx_params");
}

- (void)setRx_params:(NSDictionary *)rx_params
{
    objc_setAssociatedObject(self, @"rx_params", rx_params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - 工厂方法创建VC
+ (id)rx_vcWithString:(NSString *)string
{
    return [self rx_vcWithString:string query:nil];
}
+ (id)rx_vcWithString:(NSString *)string query:(NSDictionary *)query
{
    NSURL *url = [NSURL URLWithString:string];
    // 表示传递过来的不能得到URL
    if (url == nil) {
        // 转换成utf8编码的
        NSString *uft8String = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        url = [NSURL URLWithString:uft8String];
    }
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
    result.rx_query = query;
    result.rx_string = string;

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (NSNotFound != [string rangeOfString:@"?"].location) {
        NSString *paramString = [string substringFromIndex:([string rangeOfString:@"?"].location + 1)];
        NSCharacterSet *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
        NSScanner *scanner = [[NSScanner alloc] initWithString:paramString];
        while (![scanner isAtEnd]) {
            NSString *pairString = nil;
            [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
            [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
            NSArray *kvPair = [pairString componentsSeparatedByString:@"="];
            if (kvPair.count == 2) {
                NSString *key = kvPair[0];
                NSString *value = kvPair[1];
                [params setValue:value forKey:key];
            }
        }
    }
    result.rx_params = params;
    
    return result;
    
    
}





























@end
