//
//  homeCtl.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/5/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "homeCtl.h"

@interface homeCtl ()
@property (weak, nonatomic) IBOutlet UIImageView *cupounImage;
- (IBAction)oneHundred;

- (IBAction)fiveHundred;

- (IBAction)tenYuan;
- (IBAction)fiftyYuan;
@end

@implementation homeCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additio nal setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)oneHundred {
    
    self.cupounImage.image = [UIImage imageNamed:@"椭圆-1-拷贝"];
}

- (IBAction)fiveHundred {
    self.cupounImage.image = [UIImage imageNamed:@"2015.09.01--2015.09.30-拷贝-3"];
}

- (IBAction)tenYuan {
    self.cupounImage.image = [UIImage imageNamed:@"2015.09.01--2015.09.30-拷贝"];
}

- (IBAction)fiftyYuan {
    self.cupounImage.image = [UIImage imageNamed:@"2015.09.01--2015.09.30-拷贝-2"];
}
@end
