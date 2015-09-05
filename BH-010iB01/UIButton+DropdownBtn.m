//
//  UIButton+DropdownBtn.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/5/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "UIButton+DropdownBtn.h"
#import "UIView+Extension.h"
@implementation UIButton (DropdownBtn)
+(void)dropdownlistStyle:(UIButton *)btn{
    CGFloat tagWidth = 40;
    UIView *accessory = [[UIView alloc]initWithFrame:CGRectMake(btn.width - tagWidth, 0, btn.height, tagWidth)];
    accessory.userInteractionEnabled = NO;
    accessory.backgroundColor = [UIColor colorWithRed:(166/255.0) green:(217/255.0) blue:(89/255.0) alpha:1];
    [btn addSubview:accessory];
    btn.layer.borderColor =[UIColor colorWithRed:(166/255.0) green:(217/255.0) blue:(89/255.0) alpha:1].CGColor;
    btn.layer.borderWidth =1.0f;
}
@end
