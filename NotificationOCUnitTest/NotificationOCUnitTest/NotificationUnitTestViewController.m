//  NotificationUnitTestViewController.m
//  Created on 2018/9/28
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

#import "NotificationUnitTestViewController.h"

@interface NotificationUnitTestViewController ()

@end

@implementation NotificationUnitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.didReceiveNotification = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotification:) name:@"AVPlayerItemDidPlayToEndTimeNotification" object:nil];
}

- (void)testNotification:(NSNotification *)notification {
    if (notification.userInfo) {
        NSString *str = notification.userInfo[@"TestString"];
        [self printTestStr:str];
    }
    self.didReceiveNotification = YES;
}

- (void)printTestStr:(NSString *)testString {
    NSLog(@"%@==========**********==============", testString);
}

- (void)postNotificationWithName:(NSString *)notificationName {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AVPlayerItemDidPlayToEndTimeNotification" object:nil userInfo:@{ @"TestString": @"test" }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
