//
//  ShowSetViewController.m
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/4/1.
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
    
    //反序
    //numCell = [myDelegate.prizeInfoArray count] - [myDelegate.strCell intValue] - 1;
    
    numCell = [myDelegate.strCell intValue];
    
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
    
    
    //function 去除旧数据
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    NSMutableDictionary *processDelDicts = [[NSMutableDictionary alloc]init];
    NSString *delPrize = [[NSString alloc]init];
    unsigned int numCell = [myDelegate.strCell intValue];
    processDelDicts = [myDelegate.prizeInfoArray objectAtIndex:numCell];
    NSLog(@"processDelDicts%@", processDelDicts);
    delPrize = [processDelDicts objectForKey:@"prize"];
    NSLog(@"被删掉的是%@ 奖。",delPrize);
    //算出成员数
    unsigned long numObjProcessArray = [myDelegate.processArray count];
    
    
    //#function 删除prize信息，删除奖池信息 3.4.2015
    NSLog(@"processArray 有 %ld 个成员",numObjProcessArray);
    
    for (int i = 0; i < numObjProcessArray ; i++) {
        
        for (int j = 0; j < [myDelegate.processArray count] ; j++ ) {
            
            processDelDicts = [myDelegate.processArray objectAtIndex:j];
            NSLog(@"从process中抽出奖项名字：%@",[processDelDicts objectForKey:@"prize"]);
            
            if ( [[processDelDicts objectForKey:@"prize"]isEqualToString:delPrize] ) {
                NSLog(@"匹配成功！");
                [myDelegate.processArray removeObjectAtIndex:j];
                NSLog(@"还需要再比对%ld次", numObjProcessArray);
            }
        }
    }
    NSLog(@"去除该奖励后，奖池信息:%@", myDelegate.processArray);
    [myDelegate.prizeInfoArray removeObjectAtIndex:numCell];
    NSLog(@"删除后prizeInforArray信息：%@ ", myDelegate.prizeInfoArray);
    NSLog(@"第%d被删除", numCell);
    
    //function 从textFiled重新读入
    NSMutableDictionary *processDicts = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *prizeInfoDicts = [[NSMutableDictionary alloc] init];
    
    int num = [numTextField.text intValue];
    for (int i = 0 ; i< num; i++ ) {
        //Process 的数据
        [processDicts setValue:levelTextField.text forKey:@"level"];
        [processDicts setValue:prizeTextField.text forKey:@"prize"];
        [myDelegate.processArray addObject:processDicts];
    }
    NSLog(@"processArray%@", myDelegate.processArray);
    
    
    //prize information
    [prizeInfoDicts setValue:levelTextField.text forKey:@"level"];
    [prizeInfoDicts setValue:prizeTextField.text forKey:@"prize"];
    [prizeInfoDicts setValue:numTextField.text forKey:@"num"];
    [myDelegate.prizeInfoArray insertObject:prizeInfoDicts atIndex:[myDelegate.prizeInfoArray count]];
    
    NSLog(@"Prize's Information's Array %@", myDelegate.prizeInfoArray);


    
}


@end
