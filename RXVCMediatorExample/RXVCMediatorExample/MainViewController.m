//
//  MainViewController.m
//  RXVCMediatorExample
//
//  Created by Rush.D.Xzj on 15/11/12.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "RXVCMediatorHeader.h"

@interface MainViewController ()

@end

@implementation MainViewController
- (IBAction)btnNextTouchUpInside:(id)sender {
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://AViewController" query:@{@"data":@(1)} animate:NO];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"string=%@, query=%@, params=%@", self.rx_string, self.rx_query, self.rx_params);
    
    self.title = @"Main";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
