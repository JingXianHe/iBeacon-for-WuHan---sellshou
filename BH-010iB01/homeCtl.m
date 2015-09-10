//
//  homeCtl.m
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/5/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import "homeCtl.h"
#import "bannerCell.h"
#import "UIView+Extension.h"
#import "rootNavCtl.h"

@interface homeCtl ()
@property (weak, nonatomic) IBOutlet UIImageView *cupounImage;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property(strong,nonatomic)NSMutableArray *highlights;
@property (weak, nonatomic) IBOutlet UIView *bannerContainer;
- (IBAction)oneHundred;
@property (weak, nonatomic) IBOutlet UIPageControl *pageIndicator;

- (IBAction)fiveHundred;

- (IBAction)tenYuan;
- (IBAction)fiftyYuan;
@end

@implementation homeCtl

-(NSMutableArray *)highlights{
    if (_highlights == nil) {
        _highlights = [[NSMutableArray alloc]init];
        [_highlights addObject:@"highlight1"];
        [_highlights addObject:@"highlight2"];
        [_highlights addObject:@"highlight3"];
        [_highlights addObject:@"highlight4"];
    }
    return _highlights;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additio nal setup after loading the view.
    [self.myCollectionView registerNib:[UINib nibWithNibName:@"bannerCell" bundle:nil] forCellWithReuseIdentifier:@"news"];
    self.myCollectionView.dataSource = self;
    self.myCollectionView.delegate = self;
    ((UICollectionViewFlowLayout *) self.myCollectionView.collectionViewLayout).itemSize = CGSizeMake(self.myCollectionView.width, self.myCollectionView.height);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.pageIndicator.numberOfPages = self.highlights.count;
    self.pageIndicator.currentPage = 1;
    self.navigationItem.hidesBackButton = YES;
    [self performSelector:@selector(sendTrigger2Root) withObject:self afterDelay:2.0];
    
    rootNavCtl *root = (rootNavCtl *)self.navigationController;
    root.homeDelegate = self;
    
}
-(void)sendTrigger2Root{
    //trigger ranging ibeacon
    rootNavCtl *rootCtl = (rootNavCtl *)self.navigationController;
    [rootCtl startRangingBeacons];
}
-(void)viewDidAppear:(BOOL)animated{
        [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2000 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.highlights.count * 1000;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"news";
    bannerCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    int indexForImg = indexPath.row % 4;
    //myCell.frame = CGRectMake(indexForImg*collectionView.frame.size.width, 0, collectionV iew.frame.size.width, collectionView.frame.size.height);
    myCell.displayImg.image = [UIImage imageNamed:self.highlights[indexForImg]];
    self.pageIndicator.currentPage = indexForImg;
    return myCell;
    
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
