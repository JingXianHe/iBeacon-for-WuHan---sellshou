//
//  rootNavCtl.h
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/1/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@class homeCtl;
@interface rootNavCtl : UINavigationController<CLLocationManagerDelegate>
-(void)startRangingBeacons;
@property(weak,nonatomic)homeCtl *homeDelegate;
@end
