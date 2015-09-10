//
//  UIAlertView+PopMsg.h
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/7/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (PopMsg)
+(void)popUpMsg:(NSString *)title Content:(NSString *)img;
+(void)popUpImge:(NSString *)title Img:(UIImage *)img;
+(UIView *)showTransit:(UIView *)parent;
@end
