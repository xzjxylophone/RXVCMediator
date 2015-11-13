//
//  UIViewController+Mediator.h
//  RXVCMediatorExample
//
//  Created by Rush.D.Xzj on 15/11/12.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Mediator)


@property (nonatomic, copy) NSString *rx_string; // 传递的URL地址: rxpage://MainViewController?a=1&b=2
@property (nonatomic, strong) NSDictionary *rx_query;
@property (nonatomic, strong) NSDictionary *rx_params;






#pragma mark - 工厂方法创建VC
+ (id)rx_vcWithString:(NSString *)string;
+ (id)rx_vcWithString:(NSString *)string query:(NSDictionary *)query;

@end
