//
//  AppDelegate.m
//  BH-010iB01
//
//  Created by Tommy on 2015-08-31.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "AppDelegate.h"
#import "UIView+Extension.h"

@interface AppDelegate ()
@property(strong, nonatomic)NSTimer *time4IBeacon;
@end

@implementation AppDelegate

-(void)triggerRefreshIbeacon{
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval:5.0
                                                  target:self
                                                selector:@selector(smoothRemotePush)
                                                userInfo:nil
                                                 repeats:NO];
    [t fire];
}

-(void)smoothRemotePush{
    
    self.url4Img = @"";
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navbarBackground"] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    
    return YES;
}
//learning ibeacon
-(void)applicationDidEnterBackground:(UIApplication *)application {

}
//learning ibeacon
-(void)applicationDidBecomeActive:(UIApplication *)application {

}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}



- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}



- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
