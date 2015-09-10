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
#import "networking4Ibeacon.h"
#import "AppDelegate.h"
#import "UIAlertView+PopMsg.h"
#import "coreData.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxt;
@property (weak, nonatomic) IBOutlet UITextField *mblTxt;
@property(assign, nonatomic)BOOL isOpenScene;
@property (weak, nonatomic) IBOutlet UIView *beihaiLogoContainer;
@property (weak, nonatomic) IBOutlet UIImageView *beihaiLogo;
@property(assign, nonatomic)float logoPositionValue;
@property(assign,nonatomic)float mbltextY;
@property(assign,nonatomic)float pwdtextY;
@property(assign, nonatomic)BOOL firstLoad;
- (IBAction)loginOrOpenScene;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[networking4Ibeacon checkUserIDExist:@"a"];

    self.navigationController.navigationBar.topItem.title = @"Beacon";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.loginBtn.layer.cornerRadius = 20;
    self.loginBtn.clipsToBounds = YES;
    self.registerBtn.layer.cornerRadius = 20;
    
    self.loginBtn.clipsToBounds = YES;
    [UITextField changeStyleToBeiHai:self.pwdTxt title:@"密码"];
    [UITextField changeStyleToBeiHai:self.mblTxt title:@"手机"];
    self.isOpenScene = YES;
    self.logoPositionValue = self.beihaiLogo.centerY;
    
    self.mbltextY = self.mblTxt.centerY;
    self.pwdtextY = self.pwdTxt.centerY;
    self.mblTxt.centerY = -self.mbltextY;
    self.pwdTxt.centerY = -self.pwdtextY;
    
    self.mblTxt.delegate = self;
    self.pwdTxt.delegate = self;

}

-(void)viewWillAppear:(BOOL)animated{
    if(self.isOpenScene){
        self.navigationController.navigationBarHidden = YES;
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginOrOpenScene {
    if (self.isOpenScene) {
        self.view.userInteractionEnabled = NO;
        self.isOpenScene = NO;
        [UIView animateWithDuration:0.8 animations:^{
            self.beihaiLogo.centerY = -self.logoPositionValue;
        } completion:^(BOOL finished) {
            
            self.beihaiLogoContainer.hidden = YES;
            
            [UIView animateWithDuration:1.0 animations:^{
                self.mblTxt.centerY = self.mbltextY;
                self.pwdTxt.centerY = self.pwdtextY;
                self.navigationController.navigationBarHidden = NO;
            } completion:^(BOOL finished) {
                self.view.userInteractionEnabled = YES;
                
            }];
            
        }];
    }else{
        if ([self.mblTxt.text isEqualToString:@""]) {
            [UIAlertView popUpMsg:@"错误" Content:@"请填写手机号码"];
            return;
        }else{
            if (![UITextField verifyMobileNum:self.mblTxt.text]) {
                [UIAlertView popUpMsg:@"错误" Content:@"请填写正确手机号码"];
                return;
            }
        }
        if ([self.pwdTxt.text isEqualToString:@""]) {
            [UIAlertView popUpMsg:@"错误" Content:@"请填写密码"];
            return;
        }
        
        
        UIView *cover = [UIAlertView showTransit:self.view];
        [networking4Ibeacon login:self.mblTxt.text Password:self.pwdTxt.text result:^(NSString *data) {
            if ([data isEqualToString:@"1"]) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [UIAlertView popUpMsg:@"成功" Content:@"登陆成功"];
                    [coreData saveUserAndPwd:self.mblTxt.text Password:self.pwdTxt.text];
                    self.mblTxt.text = @"";
                    self.pwdTxt.text = @"";
                    [self performSegueWithIdentifier:@"login2home" sender:self];
                    [cover removeFromSuperview];
                }];
                
            }else{
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [UIAlertView popUpMsg:@"错误" Content:@"登陆失败"];
                    [cover removeFromSuperview];
                }];
                
            }
            
        }];

        

    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    TargetViewController *targetVC = (TargetViewController*)segue.destinationViewController;
//    targetVC.string1 = string1;
}
@end
