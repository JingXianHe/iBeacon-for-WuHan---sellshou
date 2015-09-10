//
//  AppDelegate.h
//  BH-010iB01
//
//  Created by Tommy on 2015-08-31.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(copy, atomic)NSString *url4Img;
-(void)triggerRefreshIbeacon;
@end

