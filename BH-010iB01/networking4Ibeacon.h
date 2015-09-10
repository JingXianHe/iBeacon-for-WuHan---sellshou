//
//  networking4Ibeacon.h
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/6/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface networking4Ibeacon : NSObject
+(void)registerUser:(NSString *)userName Password:(NSString *)pwd Sex:(NSString *)sex Age:(NSString *)age result:(void(^)(NSString *data))sucess;
+(void)login4User:(NSString *)userName Password:(NSString *)pwd;
+(void)checkUserIDExist:(NSString *)userName;
+(void)updateIbeaconGeo:(NSString *)userName Uuid:(NSString *)uuid Major:(NSString *)major Minor:(NSString *)minor Distance:(double)distant;
+(void)testLogin:(NSString *)param success:(void (^)(NSString *result))success;
+(void)login:(NSString *)userID Password:(NSString *)pwd result:(void(^)(NSString *data))sucess;
@end
