//
//  AViewController.m
//  RXVCMediatorExample
//
//  Created by ceshi on 17/2/21.
//  Copyright © 2017年 Rush.D.Xzj. All rights reserved.
//

#import "AViewController.h"
#import "RXVCMediatorHeader.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.title = @"A";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNextTouchUpInside:(id)sender {
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://BViewController" query:@{@"data":@(2)} animate:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"query:%@", self.rx_query[@"data"]);
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
