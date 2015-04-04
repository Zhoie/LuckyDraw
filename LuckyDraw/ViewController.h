//
//  ViewController.h
//  LuckyDraw
//
//  Created by Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSString *levelName; //奖项名
@property (nonatomic, strong) NSString *prizeName; //奖品名
@property (nonatomic, strong) NSString *numOfPrize;//奖品个数
@property (nonatomic, strong) NSMutableArray *cellDataArray;

//@property (nonatomic, strong) NSMutableArray *levelArray;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBarButton;

- (IBAction)clearBtnAciton:(id)sender;


@end
