//
//  NumViewController.h
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumViewController : UIViewController

@property (nonatomic, strong) NSString *numOfGambler;

@property (weak, nonatomic) IBOutlet UITextField *numOfGamblerTextField;

- (IBAction)backgroundTaped:(id)sender;
@end
