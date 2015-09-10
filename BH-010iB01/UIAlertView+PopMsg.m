//
//  UIAlertView+PopMsg.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/7/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "UIAlertView+PopMsg.h"

@implementation UIAlertView (PopMsg)

+(void)popUpMsg:(NSString *)title Content:(NSString *)content{
    
    UIAlertView * av = [[UIAlertView alloc] init];
    av.title = title;
    av.message = content;
    [av addButtonWithTitle:@"确定"];
    [av show];
}
+(void)popUpImge:(NSString *)title Img:(UIImage *)img{
    UIAlertView * av = [[UIAlertView alloc] init];
    av.title = title;
    [av addButtonWithTitle:@"确定"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.backgroundColor = [UIColor redColor];
    
    [imageView setImage:img];
    
    //check if os version is 7 or above
     if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        [av setValue:imageView forKey:@"accessoryView"];
     }else{
        [av addSubview:imageView];
     }
    [av show];
}
+(UIView *)showTransit:(UIView *)parent{
    UIView *cover = [[UIView alloc]initWithFrame:parent.bounds];
    cover.backgroundColor = [UIColor lightGrayColor];
    cover.alpha = 0.8;
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    activityView.center=cover.center;
    
    [cover addSubview:activityView];
    [activityView startAnimating];
    [parent addSubview:cover];
    return cover;
}
@end
