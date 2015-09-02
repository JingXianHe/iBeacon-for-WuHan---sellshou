//
//  ViewController.m
//  BH-010iB01
//
//  Created by Tommy on 2015-08-31.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+addStyle.h"
#import "UIView+Extension.h"

@interface ViewController ()<NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxt;
@property (weak, nonatomic) IBOutlet UITextField *mblTxt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationController.navigationBar.topItem.title = @"Beacon";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.loginBtn.layer.cornerRadius = 20;
    self.loginBtn.clipsToBounds = YES;
    self.registerBtn.layer.cornerRadius = 20;
    self.loginBtn.clipsToBounds = YES;
    [UITextField changeStyleToBeiHai:self.pwdTxt title:@"密码"];
    [UITextField changeStyleToBeiHai:self.mblTxt title:@"手机"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
