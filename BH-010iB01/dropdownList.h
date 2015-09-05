//
//  dropdownList.h
//  BH-010iB01
//
//  Created by beihaiSellshou on 9/2/15.
//  Copyright (c) 2015 SS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dropdownList : UIView<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tv;//下拉列表
    NSArray *tableArray;//下拉列表数据
   
    BOOL showList;//是否弹出下拉列表
    CGFloat tabheight;//table下拉列表的高度
    CGFloat frameHeight;//frame的高度
}
@property (nonatomic,retain) UITableView *tv;
@property (nonatomic,retain) NSArray *tableArray;
@property (nonatomic,weak) UIButton *textField;
@end
