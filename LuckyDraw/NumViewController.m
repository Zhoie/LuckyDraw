//
//  NumViewController.m
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import "AppDelegate.h"
#import "NumViewController.h"

@interface NumViewController ()

@end

@implementation NumViewController

@synthesize numOfGamblerTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)backgroundTaped:(id)sender{

    [numOfGamblerTextField resignFirstResponder];
    
}

- (IBAction)StartButtonAction:(id)sender {
    
    
    NSLog(@"Here is %@ player", numOfGamblerTextField.text);

    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    
    myDelegate.strPlayer = numOfGamblerTextField.text;
    
    NSUInteger numPlayer = [myDelegate.strPlayer intValue];
    NSLog(@"numPlayer %ld",numPlayer);
    
    NSUInteger numPrize = [myDelegate.processArray count];
    NSLog(@"numPrize %lu", numPrize);
   
    NSMutableDictionary *infoDicts = [[NSMutableDictionary alloc]init];
    
    NSUInteger numNone = numPlayer - numPrize;
    NSLog(@"numNone %lu", numNone);
    
    if ( numPlayer > 0 ) {
        for (int i = 0; i < numNone ; i++ ) {
            
            [infoDicts setValue:@"none" forKey:@"level"];
            [infoDicts setValue:@"none" forKey:@"prize"];
            [myDelegate.processArray addObject:infoDicts];
        }
    } else {
        //以后加上警报：关于人数不正确。
        NSLog(@"I think you need more people 0.0");
    }
   
    NSLog(@"知道参加人数后的抽奖池:%lu", [myDelegate.processArray count]);
    NSLog(@"抽奖池:%@", myDelegate.processArray);
    
    //myDelegate.exeProcessArray = myDelegate.processArray;
    myDelegate.exeProcessArray = [myDelegate.processArray mutableCopy];
    
    
}


- (IBAction)numGamblerAction:(id)sender {
    
    [sender resignFirstResponder];
}
@end
