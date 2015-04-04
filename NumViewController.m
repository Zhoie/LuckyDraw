//
//  NumViewController.m
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

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

@end
