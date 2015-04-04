//
//  DrawingViewController.m
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//


#import "AppDelegate.h"
#import "DrawingViewController.h"
#import <POP/POP.h>

@interface DrawingViewController ()

@property NSMutableArray *cellDataArray;
@property (weak, nonatomic) IBOutlet UIButton *DrawBtn;

@end

@implementation DrawingViewController

@synthesize drawTableView;

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    
    //myDelegate.exeProcessArray = myDelegate.processArray;
    
    NSLog(@"有%ld 个人抽奖", [myDelegate.exeProcessArray count] );
    NSString *strWinnner = [[NSString alloc]init];
    
    for (int i = 0 ; i < [myDelegate.exeProcessArray count] ; i++) {
        strWinnner = [NSString stringWithFormat:@"%d", i + 1];
        [myDelegate.winnerNumArray addObject:strWinnner];
    }
    //hehe

    NSLog(@"中奖号码%@", myDelegate.winnerNumArray );
    // Do any additional setup after loading the view.
}


- (IBAction)DrawingButtonAction:(id)sender {
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = @2000;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        self.DrawBtn.userInteractionEnabled = YES;
    }];
    [self.DrawBtn.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    
    if ( [myDelegate.winnerNumArray count] != 0) {
        if (!self.cellDataArray) {
            self.cellDataArray = [[NSMutableArray alloc] init];
        }
        [self.cellDataArray insertObject:[NSDate date] atIndex:0];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [self.drawTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.cellDataArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *drawViewCell = @"drawViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:drawViewCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:drawViewCell];
    }
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    
    NSMutableArray *testArray = [[NSMutableArray alloc] initWithArray:myDelegate.exeProcessArray];
    NSDictionary *testDicts = [[NSDictionary alloc] init];
    
    int numDraw;
    
    if ( [myDelegate.exeProcessArray count] != 0 ) {
        
        numDraw = (arc4random() % [myDelegate.exeProcessArray count]);
        NSLog(@"随机数%d" , numDraw);
        
        NSLog(@"you prize is %@", myDelegate.exeProcessArray[numDraw]);
        testDicts = [testArray objectAtIndex:numDraw];
        
        self.numOfPrize = [myDelegate.winnerNumArray objectAtIndex:numDraw];
        NSLog(@"取出了%@ 号", myDelegate.winnerNumArray);
        NSLog(@"剩下号码%@ ", myDelegate.winnerNumArray);
        
        self.levelName = [testDicts objectForKey:@"level"];
        self.prizeName = [testDicts objectForKey:@"prize"];
        NSString *testStr = [NSString stringWithFormat:@"号码:%@ level:%@  prize:%@",self.numOfPrize,self.levelName, self.prizeName];
        cell.textLabel.text = testStr;
        
        // [myDelegate.winnerNumArray removeObjectAtIndex:numDraw];
        [myDelegate.winnerNumArray removeObjectAtIndex:numDraw];
        [myDelegate.exeProcessArray removeObjectAtIndex:numDraw];

    }
    
    
    
//    testDicts = [testArray objectAtIndex:numDraw];
//    self.levelName = [testDicts objectForKey:@"level"];
//    self.prizeName = [testDicts objectForKey:@"prize"];
//    
//    NSString *testStr = [NSString stringWithFormat:@"level:%@  prize:%@", self.levelName, self.prizeName];
//    
//    cell.textLabel.text = testStr;
    
    return cell;
}


@end
