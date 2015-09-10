//
//  registerCtl.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/2/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "registerCtl.h"
#import "UIButton+DropdownBtn.h"
#import "UITextField+addStyle.h"
#import "UIAlertView+PopMsg.h"
#import "networking4Ibeacon.h"
#import "coreData.h"

@interface registerCtl ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *ageRangeTab;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *favorPickerBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *favorPicker;
@property (strong, nonatomic)NSArray *colorArray;
@property (weak, nonatomic) IBOutlet UITextField *userIDtxt;
@property (weak, nonatomic) IBOutlet UITextField *pwdtxt;
- (IBAction)register;
- (IBAction)goBack;


- (IBAction)showList:(id)sender;


@end

@implementation registerCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ageRangeTab.layer.borderWidth = 1.0;
    self.ageRangeTab.layer.borderColor = [UIColor colorWithRed:(166/255.0) green:(217/255.0) blue:(89/255.0) alpha:1].CGColor ;
    self.ageRangeTab.layer.cornerRadius = 20.0;
    self.ageRangeTab.clipsToBounds = YES;
    self.registerBtn.layer.cornerRadius = 20.0;
    self.registerBtn.clipsToBounds = YES;
    self.favorPickerBtn.layer.cornerRadius = 20.0;
    self.favorPickerBtn.clipsToBounds = YES;
    //self.registerBtn.layer.
    self.colorArray  = [[NSArray alloc] initWithObjects:@"",@"男性化产品",@"女性化产品", nil];
    self.favorPicker.dataSource = self;
    self.favorPicker.delegate = self;
    self.favorPicker.hidden = YES;
    
    [UITextField changeStyleToGreen:self.userIDtxt title:@"手机"];
    [UITextField changeStyleToGreen:self.pwdtxt title:@"密码"];
    
    self.userIDtxt.delegate = self;
    self.pwdtxt.delegate = self;
    
    //hide topview
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES];
    [UIButton dropdownlistStyle:self.favorPickerBtn];
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.favorPicker.frame.size.width, 44)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    label.text = [NSString stringWithFormat:@"  %@", self.colorArray[row]];
    return label;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return self.colorArray.count;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
//{
//    return [self.colorArray objectAtIndex:row];
//}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    int chosen = [pickerView selectedRowInComponent:component];
    self.favorPicker.hidden=YES;
    [self.favorPickerBtn setTitle:self.colorArray[chosen] forState:UIControlStateNormal];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)register {
    if ([self.userIDtxt.text isEqualToString:@""]) {
        [UIAlertView popUpMsg:@"错误" Content:@"请填写手机号码"];
        return;
    }else{
        if (![UITextField verifyMobileNum:self.userIDtxt.text]) {
            [UIAlertView popUpMsg:@"错误" Content:@"请填写正确手机号码"];
            return;
        }
    }
    if ([self.pwdtxt.text isEqualToString:@""]) {
        [UIAlertView popUpMsg:@"错误" Content:@"请填写密码"];
        return;
    }
    if ([self.favorPickerBtn.titleLabel.text isEqualToString:@"您的喜爱"]||[self.favorPickerBtn.titleLabel.text isEqualToString:@""]) {
        [UIAlertView popUpMsg:@"错误" Content:@"请选择您的喜爱"];
        return;
    }
    NSString *age =[self.ageRangeTab titleForSegmentAtIndex:[self.ageRangeTab selectedSegmentIndex]];
    NSString *ageInfo;
    if([age isEqualToString:@"20岁以下"]){
        ageInfo = @"20";
    }else if([age isEqualToString:@"40岁以上"]){
        ageInfo = @"40";
    }else{
        ageInfo = @"30";
    }
    NSString *gender;
    if([self.favorPickerBtn.titleLabel.text isEqualToString:@"男性化产品"]){
        gender = @"男";
    }else{
        gender = @"女";
    }

    
    UIView *cover = [UIAlertView showTransit:self.view];
    [networking4Ibeacon registerUser:self.userIDtxt.text Password:self.pwdtxt.text Sex:gender Age:ageInfo result:^(NSString *data) {
        if ([data isEqualToString:@"1"]) {
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [coreData saveUserAndPwd:self.userIDtxt.text Password:self.pwdtxt.text];
                [UIAlertView popUpMsg:@"成功" Content:@"注册成功"];
                self.userIDtxt.text = @"";
                self.pwdtxt.text = @"";
                [cover removeFromSuperview];
                [self performSegueWithIdentifier:@"register2home" sender:self];
            }];

        }else{
            [UIAlertView popUpMsg:@"错误" Content:@"注册失败"];
            [cover removeFromSuperview];
        }
        
    }];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //    TargetViewController *targetVC = (TargetViewController*)segue.destinationViewController;
    //    targetVC.string1 = string1;
}
- (IBAction)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)showList:(id)sender {
    self.favorPicker.hidden = NO;
    [self.pwdtxt resignFirstResponder];
}
@end
