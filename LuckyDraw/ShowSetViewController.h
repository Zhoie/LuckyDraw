//
//  ShowSetViewController.h
//  LuckyDraw
//
//  Created by ray on 15/4/1.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowSetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *levelTextField;
@property (weak, nonatomic) IBOutlet UITextField *prizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *numTextField;

@property (nonatomic, strong) NSString *levelName; //奖项名
@property (nonatomic, strong) NSString *prizeName; //奖品名
@property (nonatomic, strong) NSString *numOfPrize;//奖品个数

@property NSInteger index;

- (IBAction)saveBtnAction:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)levelTextFieldAction:(id)sender;

- (IBAction)prizeTextFieldAction:(id)sender;

- (IBAction)numTextFieldAction:(id)sender;


@end
