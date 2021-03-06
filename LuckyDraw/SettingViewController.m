//
//  SettingViewController.m
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import "AppDelegate.h"
#import "SettingViewController.h"
#import "ViewController.h"




//static int objCount = 0;

@interface SettingViewController ()

@end

@implementation SettingViewController

@synthesize awardTextField;
@synthesize prizeTextField;
@synthesize numOfPrizeTextField;

//@synthesize mutableArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
////    
////    myDelegate.processArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"processArray"];
////    myDelegate.prizeInfoArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"prizeInfoArray"];
////    myDelegate.strCell = [[NSUserDefaults standardUserDefaults] objectForKey:@"strCell"];
    
}


- (IBAction)awardTextField:(id)sender {//按虚拟键盘上的return让键盘消失
    
    [sender resignFirstResponder];
}

- (IBAction)prizeTextField:(id)sender {
    
    [sender resignFirstResponder];
}

- (IBAction)numTextField:(id)sender {
    
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender{//点击屏幕任何地方让键盘消失
    [numOfPrizeTextField resignFirstResponder];
    [awardTextField resignFirstResponder];
    [prizeTextField resignFirstResponder];
}

- (IBAction)saveButtonAction:(id)sender {
    
    
    //Function von der Action
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    
    [self.saveButtonAmination.layer pop_addAnimation:anim forKey:@"saveButton"];
    
    //[self.yourView.layer pop_addAnimation:anim forKey:@"typeANameForYourAnimationHere"];
    anim = [_saveButtonAmination.layer pop_animationForKey:@"saveButton"];
    if (anim) {
        /* update to value to new destination */
        velocity : anim.velocity = @(1000.);
        
    } else {
        /* create and start a new animation */
    }
    
   // [self.saveButtonAmination.layer pop_addAnimation:anim forKey:@"typeANameForYourAnimationHere"];
    
    //[saveButtonAmination pop_removeAnimationForKey:@"saveButton"];
    
    
    
    
    
   // NSLog(@"\n AwardName:%@\n PrizeName:%@\n numOfPrize:%@\n",awardTextField.text,prizeTextField.text,numOfPrizeTextField.text);
    NSMutableDictionary *processDicts = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *prizeInfoDicts = [[NSMutableDictionary alloc] init];
    
  //  NSDictionary *processDelDicts = [[NSDictionary alloc]init];
   // NSDictionary *prizeInfoDelDicts = [[NSDictionary alloc]init];
    
    
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];

    //NSString *strCell = myDelegate.strCell;
    
    
//    if ( [myDelegate.processArray count] ) {
//        processDelDicts = [myDelegate.processArray objectAtIndex:[strCell intValue]];
//        [processDelDicts
//        
//    }
//    
//    if ( [myDelegate.prizeInfoArray count] ) {
//    
//    }

    int num = [numOfPrizeTextField.text intValue];
    for (int i = 0 ; i< num; i++ ) {
        //Process 的数据
        [processDicts setValue:awardTextField.text forKey:@"level"];
        [processDicts setValue:prizeTextField.text forKey:@"prize"];
        [myDelegate.processArray addObject:processDicts];
    }
    NSLog(@"processArray%@", myDelegate.processArray);

   
    //prize information
    [prizeInfoDicts setValue:awardTextField.text forKey:@"level"];
    [prizeInfoDicts setValue:prizeTextField.text forKey:@"prize"];
    [prizeInfoDicts setValue:numOfPrizeTextField.text forKey:@"num"];
    [myDelegate.prizeInfoArray insertObject:prizeInfoDicts atIndex:[myDelegate.prizeInfoArray count]];
    
    NSLog(@"Prize's Information's Array %@", myDelegate.prizeInfoArray);
    
//    NSMutableArray *initLevelArray = [[NSMutableArray alloc]init];
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"level"] == nil) {
//        [[NSUserDefaults standardUserDefaults] setObject:initLevelArray forKey:@"level"];
//    }
//    NSArray *tempLevelArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"level"];
//    NSMutableArray *mutalLevelArray = [tempLevelArray mutableCopy];
//    NSString *textString = [NSString stringWithFormat:@"奖项：%@  奖品：%@  奖品个数：%@",awardTextField.text,prizeTextField.text, numOfPrizeTextField.text];
//
//    [mutalLevelArray insertObject:textString atIndex:0];
//    ViewController *viewCtrl = [[ViewController alloc] init];
//    viewCtrl.levelArray = mutalLevelArray;
//    [[NSUserDefaults standardUserDefaults] setObject:mutalLevelArray forKey:@"level"];
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"数据添加成功！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    
//    [alert show];

}

- (IBAction)springTouchBtnTouchDown:(id)sender {
    
    UIView *btn = (UIView *)sender;
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
    animation.springBounciness = 10;
    [btn.layer pop_addAnimation:animation forKey:@"ZoomOutY"];
}

- (IBAction)springTouchBtnTouchUp:(id)sender {
    
    UIView *btn = (UIView *)sender;
    
    [btn.layer pop_removeAnimationForKey:@"ZoomOutY"];
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    animation.springBounciness = 10;
    
    [btn.layer pop_addAnimation:animation forKey:@"ZoomOutYReverse"];
    
}

//- (void)initSpringTouch
//{
//    
//    [self addTarget:self action:@selector(springTouchBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
//    [self addTarget:self action:@selector(springTouchBtnTouchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
//}
//
//- (void)removeSpringTouch
//{
//    [self removeTarget:self action:@selector(springTouchBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
//    [self removeTarget:self action:@selector(springTouchBtnTouchUp:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];

@end
