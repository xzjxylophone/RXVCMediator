//
//  CViewController.m
//  RXVCMediatorExample
//
//  Created by ceshi on 17/2/21.
//  Copyright © 2017年 Rush.D.Xzj. All rights reserved.
//

#import "CViewController.h"
#import "RXVCMediatorHeader.h"

@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.title = @"C";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnNextTouchUpInside:(id)sender {
//    [RXVCMediator popToNearestInNavigationController:self.navigationController withString:@"rxpage://AViewController" animate:YES];
    [RXVCMediator popToFarthestInNavigationController:self.navigationController withString:@"rxpage://AViewController" animate:YES];
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
