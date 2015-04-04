//
//  SettingViewController.h
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <POP/POP.h>


@interface SettingViewController : UIViewController

@property (nonatomic, strong) NSString *levelName; //奖项名
@property (nonatomic, strong) NSString *prizeName; //奖品名
@property (nonatomic, strong) NSString *numOfPrize;//奖品个数

//@property (nonatomic, strong) NSMutableArray *mutableArray;

@property (weak, nonatomic) IBOutlet UITextField *awardTextField;
@property (weak, nonatomic) IBOutlet UITextField *prizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *numOfPrizeTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButtonAmination;




- (IBAction)awardTextField:(id)sender;
- (IBAction)prizeTextField:(id)sender;
- (IBAction)numTextField:(id)sender;

- (IBAction)backgroundTap:(id)sender;

- (IBAction)saveButtonAction:(id)sender;
- (IBAction)springTouchBtnTouchDown:(id)sender;

- (IBAction)springTouchBtnTouchUp:(id)sender;


- (void)initSpringTouch;


@end
