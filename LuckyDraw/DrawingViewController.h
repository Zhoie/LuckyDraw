//
//  DrawingViewController.h
//  LuckyDraw
//
//  Created by Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

- (IBAction)DrawingButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *drawTableView;

@property (nonatomic, strong) NSString *levelName; //奖项名
@property (nonatomic, strong) NSString *prizeName; //奖品名
@property (nonatomic, strong) NSString *numOfPrize;//奖品个数


@end
