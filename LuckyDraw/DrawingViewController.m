//
//  DrawingViewController.m
//  LuckyDraw
//
//  Created by ray on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//


#import "AppDelegate.h"
#import "DrawingViewController.h"

@interface DrawingViewController ()

@property NSMutableArray *cellDataArray;

@end

@implementation DrawingViewController

@synthesize drawTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)DrawingButtonAction:(id)sender {
    
    if (!self.cellDataArray) {
        self.cellDataArray = [[NSMutableArray alloc] init];
    }
    [self.cellDataArray insertObject:[NSDate date] atIndex:0];
    
     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.drawTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
    
    NSMutableArray *testArray = [[NSMutableArray alloc] initWithArray:myDelegate.processArray];
    NSDictionary *testDicts = [[NSDictionary alloc] init];
    
    int numDraw;
    
    if ( [myDelegate.processArray count] != 0 ) {
        
        numDraw = (arc4random() % [myDelegate.processArray count]);
        NSLog(@"you prize is %@", myDelegate.processArray[numDraw]);
        [myDelegate.processArray removeObjectAtIndex:numDraw];
    }
    
    testDicts = [testArray objectAtIndex:numDraw];
    self.levelName = [testDicts objectForKey:@"level"];
    self.prizeName = [testDicts objectForKey:@"prize"];
    
    NSString *testStr = [NSString stringWithFormat:@"level:%@  prize:%@", self.levelName, self.prizeName];
    
    cell.textLabel.text = testStr;
    
    return cell;
}


@end
