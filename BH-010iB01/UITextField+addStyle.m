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

+(void)changeStyleToBeiHai:(UITextField *)textField{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 40)];
    paddingView.backgroundColor = [UIColor greenColor];
    textField.height = 40;
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.layer.borderWidth = 2.0;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.cornerRadius = 15.0;
    
}

@end
