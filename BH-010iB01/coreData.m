//
//  coreData.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/8/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "coreData.h"

@implementation coreData
+(void)saveUserAndPwd:(NSString *)user Password:(NSString *)pwd{
    [[NSUserDefaults standardUserDefaults] setObject:user forKey:@"user"];
    [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:@"password"];
}
+(NSString *)getUserName{
   NSString* thatArray = [[NSUserDefaults standardUserDefaults] stringForKey:@"user"];
    return thatArray;
}
+(NSString *)getPassword{
    NSString* thatArray = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    return thatArray;
}
@end
