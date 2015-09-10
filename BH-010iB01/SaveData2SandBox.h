//
//  SaveData2SandBox.h
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/8/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveData2SandBox : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *ipAddressTxt;
- (IBAction)changeIP;

@end
