//
//  coreData.h
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/8/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface coreData : NSObject
+(void)saveUserAndPwd:(NSString *)user Password:(NSString *)pwd;
+(NSString *)getUserName;
+(NSString *)getPassword;
@end
