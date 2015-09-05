//
//  JXNetwork.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/2/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "JXNetwork.h"

@implementation JXNetwork

-(void)connect{
    NSString *post = [NSString stringWithFormat: @"UserID=%@&Sex=%@&Age=%@&Password=%@", @"aaa", @"bbbb",@"bcccc",@"ddd"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:@"http://192.168.1.15:20655/Home/IBeaconMessage"]];
    [request setHTTPMethod:@"POST"]; [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setTimeoutInterval:20.0];
    [request setHTTPBody:postData]; [NSURLConnection connectionWithRequest:request delegate:self];
    //- See more at: https://www.sundoginteractive.com/blog/ios-programmatically-posting-to-http-and-webview#sthash.J3OwK4Ou.dpuf
}

-(void)get{
    
    //http://192.168.1.15:20655/Home/IBeaconMessage
    
}

@end
