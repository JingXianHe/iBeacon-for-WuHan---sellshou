//
//  UITextField+addStyle.m
//  BH-010iB01
//
//  Created by Tommy on 2015-08-31.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "UITextField+addStyle.h"
#import "UIView+Extension.h"

@implementation UITextField (addStyle)

+(void)changeStyleToBeiHai:(UITextField *)textField title:(NSString *)titlename{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 40)];
    paddingView.backgroundColor = [UIColor colorWithRed:(96/255.0) green:(173/255.0) blue:(232/255.0) alpha:1] ;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:paddingView.bounds];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = titlename;
    titleLabel.font = [titleLabel.font fontWithSize:14.0];
    
    [paddingView addSubview:titleLabel];
    
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.layer.borderWidth = 1.0;
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textField.layer.cornerRadius = 20.0;
    
}

@end
