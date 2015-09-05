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

@interface registerCtl ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *ageRangeTab;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *favorPickerBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *favorPicker;
@property (strong, nonatomic)NSArray *colorArray;
@property (weak, nonatomic) IBOutlet UITextField *userIDtxt;
@property (weak, nonatomic) IBOutlet UITextField *pwdtxt;
- (IBAction)register;


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
    self.colorArray  = [[NSArray alloc] initWithObjects:@"男性化产品",@"女性化产品", nil];
    self.favorPicker.dataSource = self;
    self.favorPicker.delegate = self;
    self.favorPicker.hidden = YES;
    
    [UITextField changeStyleToGreen:self.userIDtxt title:@"手机"];
    [UITextField changeStyleToGreen:self.pwdtxt title:@"密码"];
    //hide topview
    self.navigationController.navigationBarHidden = NO;
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [UIButton dropdownlistStyle:self.favorPickerBtn];
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
    return 2;
    
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
    [self performSegueWithIdentifier:@"register2home" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //    TargetViewController *targetVC = (TargetViewController*)segue.destinationViewController;
    //    targetVC.string1 = string1;
}
- (IBAction)showList:(id)sender {
    self.favorPicker.hidden = NO;
}
@end
