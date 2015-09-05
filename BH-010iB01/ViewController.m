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

@interface ViewController ()

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
    self.firstLoad = YES;


}

-(void)viewWillAppear:(BOOL)animated{
    if(self.isOpenScene){
        self.navigationController.navigationBarHidden = YES;
    }
}

-(void)viewDidAppear:(BOOL)animated{
    if (self.firstLoad) {
        self.mbltextY = self.mblTxt.centerY;
        self.pwdtextY = self.pwdTxt.centerY;
        self.mblTxt.centerY = -self.mbltextY;
        self.pwdTxt.centerY = -self.pwdtextY;
        self.firstLoad = NO;
    }

    
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
            
            [UIView animateWithDuration:0.8 animations:^{
                self.mblTxt.centerY = self.mbltextY;
                self.pwdTxt.centerY = self.pwdtextY;
                self.navigationController.navigationBarHidden = NO;
            } completion:^(BOOL finished) {
                self.view.userInteractionEnabled = YES;
                
            }];
            
        }];
    }else{
        [self performSegueWithIdentifier:@"login2home" sender:self];
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    TargetViewController *targetVC = (TargetViewController*)segue.destinationViewController;
//    targetVC.string1 = string1;
}
@end
