//
//  ViewController.m
//  LuckyDraw
//
//  Created by Ray and Niklas on 15/3/25.
//  Copyright (c) 2015年 iTeam. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SettingViewController.h"
#import "ShowSetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize addBarButton;

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
     AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    return [myDelegate.prizeInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *myIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    
    NSDictionary *prizeInfo = [[NSDictionary alloc] init];
    prizeInfo = [myDelegate.prizeInfoArray objectAtIndex:indexPath.row];
    NSString *level = [prizeInfo objectForKey:@"level"];
    NSString *prize = [prizeInfo objectForKey:@"prize"];
    NSString *num = [prizeInfo objectForKey:@"num"];
    NSString *prizeInfoStr = [NSString stringWithFormat:@"奖项：%@ 奖品：%@ 奖品个数：%@", level, prize, num];
    
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
    
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
        
        //NSMutableDictionary *processDicts = [[NSMutableDictionary alloc] init];
       // NSMutableDictionary *prizeInfoDicts = [[NSMutableDictionary alloc] init];
        
        NSMutableDictionary *processDelDicts = [[NSMutableDictionary alloc]init];
       // NSArray *processDelArray = [[NSArray alloc]init];
        
        
        NSString *delPrize = [[NSString alloc]init];
        
<<<<<<< HEAD
=======

        

>>>>>>> origin/master
        processDelDicts = [myDelegate.prizeInfoArray objectAtIndex:indexPath.row];
        NSLog(@"processDelDicts%@", processDelDicts);
        delPrize = [processDelDicts objectForKey:@"prize"];
        NSLog(@"被删掉的是%@ 奖。",delPrize);
        
        //算出成员数
        unsigned long numObjProcessArray = [myDelegate.processArray count];
        

<<<<<<< HEAD
=======
    
>>>>>>> origin/master
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
        

<<<<<<< HEAD
=======
        
        

>>>>>>> origin/master
        [myDelegate.prizeInfoArray removeObjectAtIndex:indexPath.row];
        NSLog(@"删除后prizeInforArray信息：%@ ", myDelegate.prizeInfoArray);
        NSLog(@"第%ld被删除", indexPath.row);
        
<<<<<<< HEAD

=======
>>>>>>> origin/master
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
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
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication]delegate];
    [myDelegate.processArray removeAllObjects];
    [myDelegate.prizeInfoArray removeAllObjects];
    
    [self.myTableView reloadData];
    
    
}

@end
