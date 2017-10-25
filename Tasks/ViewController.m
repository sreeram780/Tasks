//
//  ViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "ViewController.h"
#import "ClockViewController.h"
#import "AutoTextViewController.h"
#import "VisitingViewController.h"
#import "EnterTextViewController.h"
#import "SearchViewController.h"
#import "StackViewController.h"
#import "AlertTableViewController.h"


static NSString* KcellId = @"taskCell";


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *listofTasks;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Tasks";
    self.navigationController.navigationBar.translucent = NO;

    listofTasks = [NSMutableArray arrayWithObjects:@"Clock",@"AutoTextView",@"Visitor",@"Expand Text",@"SearchTable",@"StackView",@"AlertToTable", nil];
    [_tasksTable registerClass:[UITableViewCell class] forCellReuseIdentifier:KcellId];
    _tasksTable.tableFooterView = [UIView new];
}

#pragma mark UITableview datasource and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listofTasks count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KcellId forIndexPath:indexPath];
    
    cell.textLabel.text = [listofTasks objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        ClockViewController *clock = [[ClockViewController alloc]initWithNibName:@"ClockViewController" bundle:nil];
        [self.navigationController pushViewController:clock animated:YES];
    }
    
    if (indexPath.row==1)
    {
        AutoTextViewController *autotext = [[AutoTextViewController alloc]initWithNibName:@"AutoTextViewController" bundle:nil];
        [self.navigationController pushViewController:autotext animated:YES];
    }
    
    if (indexPath.row == 2)
    {
        VisitingViewController *visitor = [[VisitingViewController alloc]initWithNibName:@"VisitingViewController" bundle:nil];
        [self.navigationController pushViewController:visitor animated:YES];
    }
    
    if (indexPath.row == 3)
    {
        EnterTextViewController *text = [[EnterTextViewController alloc]initWithNibName:@"EnterTextViewController" bundle:nil];
        [self.navigationController pushViewController:text animated:YES];
    }
    if (indexPath.row == 4)
    {
        SearchViewController *text = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
        [self.navigationController pushViewController:text animated:YES];
    }
    if (indexPath.row == 5)
    {
        StackViewController *text = [[StackViewController alloc]initWithNibName:@"StackViewController" bundle:nil];
        [self.navigationController pushViewController:text animated:YES];
    }
    if (indexPath.row == 6)
    {
        AlertTableViewController *text = [[AlertTableViewController alloc]initWithNibName:@"AlertTableViewController" bundle:nil];
        [self.navigationController pushViewController:text animated:YES];
    }
    
}

@end
