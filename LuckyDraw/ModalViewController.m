//
//  ModalViewController.m
//  LuckyDraw
//
//  Created by ZHOUTAO on 15/4/6.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import "ModalViewController.h"
#import "AppDelegate.h"

@interface ModalViewController ()

@property (nonatomic) UILabel *showDrawInfoLable;
@property (nonatomic,strong) NSString *numOfPrize;
@property (nonatomic,strong) NSString *levelName;
@property (nonatomic,strong) NSString *prizeName;

- (void)addDismissButton;
- (void)dismiss:(id)sender;
- (void)addLable;
@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 8.f;
    self.view.backgroundColor = [UIColor colorWithRed:(float)(52/255.f) green:(float)(152/255.f) blue:(float)(219/255.f) alpha:1.f];
    [self addDismissButton];
    [self addLable];
    
}

- (void)addLable{
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    
    NSMutableArray *testArray = [[NSMutableArray alloc] initWithArray:myDelegate.exeProcessArray];
    NSDictionary *testDicts = [[NSDictionary alloc] init];
    
    int numDraw;
    
    if ( [myDelegate.exeProcessArray count] != 0 ) {
        
        numDraw = (arc4random() % [myDelegate.exeProcessArray count]);
  
        testDicts = [testArray objectAtIndex:numDraw];
        
        self.numOfPrize = [myDelegate.winnerNumArray objectAtIndex:numDraw];
        self.levelName = [testDicts objectForKey:@"level"];
        self.prizeName = [testDicts objectForKey:@"prize"];
     
    }

    
    self.showDrawInfoLable = [UILabel new];
    self.showDrawInfoLable.font = [UIFont fontWithName:@"Avenir-Light" size:12];
    self.showDrawInfoLable.textColor = [UIColor colorWithRed:(float)(241/255.f) green:
                                        (float)(196/255.f) blue:(float)(15/255.f) alpha:1.f];
    self.showDrawInfoLable.translatesAutoresizingMaskIntoConstraints = NO;
    NSString *prizeInfoStr = [NSString stringWithFormat:@"恭喜%@号中%@奖，奖品为：%@!",self.numOfPrize, self.levelName, self.prizeName];
    self.showDrawInfoLable.textAlignment = NSTextAlignmentCenter;
    self.showDrawInfoLable.text = prizeInfoStr;
    
    
    [self.view addSubview:self.showDrawInfoLable];

}


- (void)addDismissButton
{
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
    dismissButton.translatesAutoresizingMaskIntoConstraints = NO;
    dismissButton.tintColor = [UIColor whiteColor];
    dismissButton.titleLabel.font = [UIFont fontWithName:@"Avenir" size:20];
    [dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismissButton];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dismissButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[dismissButton]-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(dismissButton)]];
}

- (void)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
