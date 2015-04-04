//
//  SettingViewController.m
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

@synthesize awardTextField;
@synthesize prizeTextField;
@synthesize numOfPrizeTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)awardTextField:(id)sender {//按虚拟键盘上的return让键盘消失
    
    [sender resignFirstResponder];
}

- (IBAction)prizeTextField:(id)sender {
    
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender{//点击屏幕任何地方让键盘消失
    [numOfPrizeTextField resignFirstResponder];
    [awardTextField resignFirstResponder];
    [prizeTextField resignFirstResponder];
}

- (IBAction)saveButtonAction:(id)sender {
    
    self.awardName = awardTextField.text;
    self.prizeName = prizeTextField.text;
    self.numOfPrize = numOfPrizeTextField.text;
    
    
    NSLog(@"\n AwardName:%@\n PrizeName:%@\n numOfPrize:%@\n",self.awardName, self.prizeName, self.numOfPrize);
}
@end
