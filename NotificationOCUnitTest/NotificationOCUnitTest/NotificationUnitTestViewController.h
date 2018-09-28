//  NotificationUnitTestViewController.h
//  Created on 2018/9/28
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

#import <UIKit/UIKit.h>

@interface NotificationUnitTestViewController : UIViewController
@property(assign, nonatomic) BOOL didReceiveNotification;
- (void)postNotificationWithName:(NSString*)notificationName;
- (void)printTestStr:(NSString *)testString;
@end
