//
//  ShowSetViewController.m
//  LuckyDraw
//
//  Created by ray on 15/4/1.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import "ShowSetViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"


static unsigned long numCell;//Cell在数组中的正确位置

@interface ShowSetViewController ()

@end

@implementation ShowSetViewController

@synthesize levelTextField;
@synthesize prizeTextField;
@synthesize numTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"level"];
//    NSString *oldtext = [array objectAtIndex:self.index];
//    self.levelTextField.text = oldtext;
//    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
//    NSMutableArray *multableArray = [[NSMutableArray alloc] initWithArray:myDelegate.prizeInfoArray];
//    NSMutableDictionary *multableDicts = [[NSMutableDictionary alloc] init];
//    multableDicts = [multableArray objectAtIndex:0];
////////////////////////////////////////////////////////////////////////////////////////////
//Niklas 1.4.2015
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    NSDictionary *editInfoDicts = [[NSDictionary alloc]init];
    
    numCell = [myDelegate.prizeInfoArray count] - [myDelegate.strCell intValue] - 1;
    
    NSLog(@"第%@个cell在数组中是%ld：", myDelegate.strCell, numCell);

    editInfoDicts = [myDelegate.prizeInfoArray objectAtIndex:numCell];
    
    
    // NSLog(@"测试是否读出cell中得文字%@", testGetDate);
    
    self.levelTextField.text = [editInfoDicts objectForKey:@"level"];
    self.prizeTextField.text = [editInfoDicts objectForKey:@"prize"];
    self.numTextField.text = [editInfoDicts objectForKey:@"num"];
    
    NSLog(@"ShowView被加载");
/////////////////////////////////////////////////////////////////////////////////

    
    
//    levelTextField.text = self.levelName;
//    prizeTextField.text = self.prizeName;
//    numTextField.text = self.numOfPrize;
}

- (IBAction)backgroundTap:(id)sender{
    
    [levelTextField resignFirstResponder];
    [prizeTextField resignFirstResponder];
    [numTextField resignFirstResponder];
}

- (IBAction)levelTextFieldAction:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)prizeTextFieldAction:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)numTextFieldAction:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)saveBtnAction:(id)sender {
    
//    NSArray *tempArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"level"];
//    NSMutableArray *mutableArray = [tempArray mutableCopy];
//    NSString *textstring = [NSString stringWithFormat:@"奖项：%@  奖品：%@  奖品个数：%@",self.levelTextField.text,self.prizeTextField.text, self.numTextField.text];
//    ViewController *viewctrl = [[ViewController alloc]init];
//    [mutableArray removeObjectAtIndex:self.index];
//    [mutableArray insertObject:textstring atIndex:0];
//    [[NSUserDefaults standardUserDefaults] setObject:mutableArray forKey:@"level"];
//    viewctrl.levelArray = mutableArray;
//    
////    [self.levelTextField resignFirstResponder];
//    UIAlertView *SaveBtnAlert = [[UIAlertView alloc] initWithTitle:nil message:@"修改数据成功" delegate:nil cancelButtonTitle:@"朕知道了" otherButtonTitles:nil, nil];
//    [SaveBtnAlert show];
}


@end
