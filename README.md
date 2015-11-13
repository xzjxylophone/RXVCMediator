# RXVCMediator
使用方法:

```objective-c

- (void)showMain
{
    NSDictionary *query = @{@"param1":@"param1Value",
                            @"param2":@"param2Vale"};
    UIViewController *vc = [UIViewController rx_vcWithString:@"rxpage://MainViewController?a=1&b=2&c=3" query:query];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nc;
}


- (IBAction)btnNextTouchUpInside:(id)sender {
    [RXVCMediator pushInNavigationController:self.navigationController withString:@"rxpage://FirstViewController" query:nil animate:YES];
}

```
http://www.cnblogs.com/xzjxylophone/p/4962517.html

