//
//  SaveData2SandBox.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/8/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "SaveData2SandBox.h"
#import "UIAlertView+PopMsg.h"
@implementation SaveData2SandBox

-(void)viewDidLoad{
    self.ipAddressTxt.delegate = self;
}


- (IBAction)changeIP {
    if (self.ipAddressTxt.text == nil) {
        [UIAlertView popUpMsg:@"错误" Content:@"IP不能为空"];
        return;
    }
    NSString* ipAddress = self.ipAddressTxt.text;
    [[NSUserDefaults standardUserDefaults] setObject:ipAddress forKey:@"myIpAddress"];
    self.ipAddressTxt.text = @"";

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end
