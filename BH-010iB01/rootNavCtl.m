//
//  rootNavCtl.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/1/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "rootNavCtl.h"
#import "UIView+Extension.h"
#import "UIAlertView+PopMsg.h"
#import "networking4Ibeacon.h"
#import "AppDelegate.h"
#import "homeCtl.h"

@interface rootNavCtl ()
@property (nonatomic, strong) CLLocationManager * locationManager;
@property(nonatomic,strong)CLBeaconRegion *region;
@property(nonatomic,strong)CLBeacon *lastFoundBeacon;
@property(assign, nonatomic)CLProximity lastProximity;
@property(assign, atomic)BOOL isDetectting;
@property(copy,nonatomic)NSString *msg;

@end

@implementation rootNavCtl
static NSString * uuid = @"FDA50693-A4E2-4FB1-AFCF-C6EB07647825";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //delete url for img
    self.isDetectting = YES;
    [NSTimer scheduledTimerWithTimeInterval:30.0
                                     target:self
                                   selector:@selector(targetMethod)
                                   userInfo:nil
                                    repeats:YES];

    
}
-(void)targetMethod{
   AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    if(delegate.url4Img!=nil){
        delegate.url4Img = nil;
    }
    self.isDetectting = YES;
}



-(void)startRangingBeacons{
    NSUUID * regionUUID = [[NSUUID alloc] initWithUUIDString:uuid];
    CLBeaconMajorValue major = UINT16_C(10002);
    CLBeaconMinorValue minor = UINT16_C(31863);
    self.region = [[CLBeaconRegion alloc] initWithProximityUUID:regionUUID major:major minor:minor identifier:@"My Region"];
    [self.region setNotifyOnEntry:YES];
    [self.region setNotifyOnExit:YES];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startRangingBeaconsInRegion:self.region];
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region{
    [self.locationManager stopRangingBeaconsInRegion:self.region];
    if (beacons.count == 0) {
        [self.locationManager startRangingBeaconsInRegion:self.region];
        return;
    }
//    NSMutableArray *filterResults = [[NSMutableArray alloc]init];
//    for (CLBeacon *item in beacons) {
//        if (item.proximity != CLProximityUnknown) {
//            [filterResults addObject:item];
//        }
//    }
    
    CLBeacon *nearbyBeacon = beacons.firstObject;
//    NSString *msg ;
//        switch (nearbyBeacon.proximity) {
//              case CLProximityFar:
//                    msg = @"far";
//                    break;
//               case CLProximityImmediate:
//                        msg = @"Immediate";
//                        break;
//                    case CLProximityNear:
//                        msg = @"Near";
//                        break;
//    
//                    default:
//                        msg = @"unknown";
//                        break;
//                }
//    if (self.lastFoundBeacon !=nearbyBeacon) {
//        self.lastFoundBeacon = nearbyBeacon;
//        self.lastProximity = nearbyBeacon.proximity;
//        self.msg = [NSString stringWithFormat:@"foundBeacon :minor = %@--%@",self.lastFoundBeacon.minor,self.lastFoundBeacon.major];
//        
//        switch (self.lastFoundBeacon.proximity) {
//            case CLProximityFar:
//                msg = @"far";
//                break;
//            case CLProximityImmediate:
//                msg = @"Immediate";
//                break;
//            case CLProximityNear:
//                msg = @"Near";
//                break;
//                
//            default:
//                msg = @"unknown";
//                break;
//        }
//        
//    }else{
//        if (self.lastProximity != nearbyBeacon.proximity) {
//            self.lastProximity = nearbyBeacon.proximity;
//            NSString *msg;
//            switch (nearbyBeacon.proximity) {
//                case CLProximityFar:
//                    msg = @"far";
//                    break;
//                case CLProximityImmediate:
//                    msg = @"Immediate";
//                    break;
//                case CLProximityNear:
//                    msg = @"Near";
//                    break;
//                    
//                default:
//                    msg = @"unknown";
//                    break;
//            }
//
//        }
//    }
    NSString *msg;
        if (self.lastProximity != nearbyBeacon.proximity) {
            self.lastProximity = nearbyBeacon.proximity;
            
            switch (nearbyBeacon.proximity) {
                case CLProximityFar:
                    msg = @"far";
                    break;
                case CLProximityImmediate:
                    msg = @"Immediate";
                    break;
                case CLProximityNear:
                    msg = @"Near";
                    break;
    
                default:
                    msg = @"unknown";
                    break;
            }
    
        }
//([msg isEqualToString:@"Immediate"])&&(self.isDetectting == YES)
    if (([msg isEqualToString:@"Immediate"]||[msg isEqualToString:@"Near"])&&(self.isDetectting == YES)) {
        
        if (nearbyBeacon.accuracy < 2.0) {
            self.isDetectting = NO;
            
            NSString *majorStr = (NSString *)self.lastFoundBeacon.major;
            NSString *minorStr = (NSString *)self.lastFoundBeacon.minor;
            [networking4Ibeacon updateIbeaconGeo:@"123456789" Uuid:uuid Major:majorStr Minor:minorStr Distance:nearbyBeacon.accuracy];
            self.homeDelegate.titleView.title = @"iBeacon";
            
        }
        
        
    }else if([msg isEqualToString:@"far"]||[msg isEqualToString:@"Near"]||[msg isEqualToString:@"unknown"]){
        if (nearbyBeacon.accuracy > 2.0) {
            self.isDetectting = YES;
            self.homeDelegate.titleView.title = @"正在搜索";

        }

    }
    [self.locationManager startRangingBeaconsInRegion:self.region];
}

-(void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error{

    [UIAlertView popUpMsg:@"错误" Content:[NSString stringWithFormat:@"Left Region'%@'", error.description]];
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    [UIAlertView popUpMsg:@"错误" Content:[NSString stringWithFormat:@"Left Region'%@'", error.description]];
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

@end
