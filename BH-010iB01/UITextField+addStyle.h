//
//  UITextField+addStyle.h
//  BH-010iB01
//
//  Created by Tommy on 2015-08-31.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (addStyle)

+(void)changeStyleToBeiHai:(UITextField *)textField title:(NSString *)titlename;
+(void)changeStyleToGreen:(UITextField *)textField title:(NSString *)titlename;
+(BOOL)verifyMobileNum:(NSString *)num;
@end
