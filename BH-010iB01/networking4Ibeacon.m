//
//  networking4Ibeacon.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/6/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "networking4Ibeacon.h"
#import <UIKit/UIKit.h>
#import "UIAlertView+PopMsg.h"
#import "AppDelegate.h"

@implementation networking4Ibeacon

+(NSString *)getIpAddressFromSandBox{
    NSString* thatArray = [[NSUserDefaults standardUserDefaults] stringForKey:@"myIpAddress"];
    if (thatArray ==nil) {
        thatArray = @"http://192.168.1.15";
    }
    return thatArray;
    
    
}

+(void)registerUser:(NSString *)userName Password:(NSString *)pwd Sex:(NSString *)sex Age:(NSString *)age result:(void(^)(NSString *data))sucess
{
    // 1. URL
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",[self getIpAddressFromSandBox],@":20655/Home/ASignup"];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 2. 请求(可以改的请求)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // ? POST
    // 默认就是GET请求
    request.HTTPMethod = @"POST";
    // ? 数据体
    NSString *str = [NSString stringWithFormat:@"UserID=%@&Password=%@&Sex=%@&Age=%@", userName, pwd,sex,age];
    // 将字符串转换成数据
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError == nil) {
            // 网络请求结束之后执行!
            // 将Data转换成字符串
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            sucess(str);
            
            // num = 2
            //NSLog(@"%@ %@", str, [NSThread currentThread]);
            
            // 更新界面
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                self.urlAddress = str;
//            }];
        }
    }];
}
+(void)checkUserIDExist:(NSString *)userName
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",[self getIpAddressFromSandBox],@":20655/Home/VerifyUserID"];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 2. 请求(可以改的请求)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // ? POST
    // 默认就是GET请求
    request.HTTPMethod = @"POST";
    // ? 数据体
    NSString *str = [NSString stringWithFormat:@"UserID=%@", userName];
    // 将字符串转换成数据
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError == nil) {
            // 网络请求结束之后执行!
            // 将Data转换成字符串
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);

        }
    }];
}
+(void)login4User:(NSString *)userName Password:(NSString *)pwd{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",[self getIpAddressFromSandBox],@":20655/Home/ASignup"];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 2. 请求(可以改的请求)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // ? POST
    // 默认就是GET请求
    request.HTTPMethod = @"POST";
    // ? 数据体
    NSString *str = [NSString stringWithFormat:@"UserID=%@&Password=%@", userName,pwd];
    // 将字符串转换成数据
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError == nil) {
            // 网络请求结束之后执行!
            // 将Data转换成字符串
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);
            
            // num = 2
            //NSLog(@"%@ %@", str, [NSThread currentThread]);
            
            // 更新界面
            //            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //                self.urlAddress = str;
            //            }];
        }
    }];
}

+(void)updateIbeaconGeo:(NSString *)userName Uuid:(NSString *)uuid Major:(NSString *)major Minor:(NSString *)minor Distance:(double )distant
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",[self getIpAddressFromSandBox],@":20655/Home/IBeaconMessage"];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 2. 请求(可以改的请求)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // ? POST
    // 默认就是GET请求
    request.HTTPMethod = @"POST";
    // ? 数据体
    NSString *str = [NSString stringWithFormat:@"UserID=%@&UID=%@&Major=%@&Minor=%@&Distance=%f", userName, uuid,major,minor,distant];
    // 将字符串转换成数据
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError == nil) {
            // 网络请求结束之后执行!
            // 将Data转换成字符串
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if ([str isEqualToString:@"0"]) {
                //[UIAlertView popUpMsg:@"0" Content:@"pp"];
                return;
            }
            

            //NSLog(@"%@",str);
            AppDelegate *delegate = [UIApplication sharedApplication].delegate;
            if (![str isEqualToString:delegate.url4Img]) {
                
                delegate.url4Img = str;
                [delegate triggerRefreshIbeacon];
                NSURL *url = [NSURL URLWithString:str];
                NSData *imageData = [NSData dataWithContentsOfURL:url];
                UIImage *profile = [UIImage imageWithData:imageData];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [UIAlertView popUpImge:@"iBeacon推送" Img:profile];
                }];
            }

        }
    }];
}
+(void)testLogin:(NSString *)param success:(void (^)(NSString *result))success{
    success(param);
}
+(void)login:(NSString *)userID Password:(NSString *)pwd result:(void(^)(NSString *data))sucess{
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",[self getIpAddressFromSandBox],@":20655/Home/Logon"];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 2. 请求(可以改的请求)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // ? POST
    // 默认就是GET请求
    request.HTTPMethod = @"POST";
    // ? 数据体
    NSString *str = [NSString stringWithFormat:@"UserID=%@&Password=%@", userID, pwd];
    // 将字符串转换成数据
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError == nil) {
            // 网络请求结束之后执行!
            // 将Data转换成字符串
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            sucess(str);
            
        }
    }];
}
@end
