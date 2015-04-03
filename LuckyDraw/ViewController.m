//
//  ViewController.m
//  LuckyDraw
//
//  Created by ray on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SettingViewController.h"
#import "ShowSetViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize addBarButton,levelArray;

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
   // self.levelArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"level"];
    [self.myTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.myTableView.tableFooterView = [[UIView alloc] init];
    
   // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.navigationItem.rightBarButtonItem = self.addBarButton;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.levelArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *myIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];
    
    NSString *prizeInfoStr = [[NSString alloc] init];
    prizeInfoStr = [self.levelArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = prizeInfoStr;

    return cell;
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    [self.myTableView setEditing:editing animated:animated];
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    NSMutableDictionary *processDicts = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *prizeInfoDicts = [[NSMutableDictionary alloc] init];
    
    //  NSDictionary *processDelDicts = [[NSDictionary alloc]init];
    // NSDictionary *prizeInfoDelDicts = [[NSDictionary alloc]init];

    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //[self.levelArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSLog(@"第%ld被删除", indexPath.row);
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // 
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShowSetViewController *showSetViewCtrl = [[ShowSetViewController alloc] init];
    NSInteger row = [indexPath row];
    showSetViewCtrl.index = row;
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    myDelegate.strCell = [NSString stringWithFormat:@"%ld", row];
    
    NSLog(@"第 %ld 个cell", row);
}


////cell的segue方法：1.传递行标row 2.传递该行数据到showSetViewController显示
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//
//    if ([segue.identifier isEqualToString:@"showSetSegue"]) {
//        
//        UIViewController *viewCtrl = segue.destinationViewController;
//        ShowSetViewController *showSetViewCtrl = (ShowSetViewController *)viewCtrl;
//        
//        NSIndexPath *indexPath = [self.myTableView indexPathForCell:sender];
//
//        NSInteger row = [indexPath row];
//        showSetViewCtrl.index = row;//实现把行标row传递到showSetViewController,存在index
//        
//        AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
//        
//        
////        NSMutableDictionary *prizeInfoDicts = [[NSMutableDictionary alloc] init];
////        prizeInfoDicts = [myDelegate.prizeInfoArray objectAtIndex:row];
////        showSetViewCtrl.levelName = [prizeInfoDicts objectForKey:@"level"];
////        showSetViewCtrl.prizeName = [prizeInfoDicts objectForKey:@"prize"];
////        showSetViewCtrl.numOfPrize = [prizeInfoDicts objectForKey:@"num"];
//    
//    }
//
//}


//删除键clear－－清空数组，并删除保存在本地的数据
- (IBAction)clearBtnAciton:(id)sender {
    
    
//    NSLog(@"clear被按下。");
//    for (int i; i < self.levelArray.count; i ++) {
//        [self.levelArray removeAllObjects];
//    }
//    
//    NSUserDefaults *delete = [NSUserDefaults standardUserDefaults];
//    [delete removeObjectForKey:@"level"];
//    [delete synchronize];
//    [self.myTableView reloadData];
    
}

@end
