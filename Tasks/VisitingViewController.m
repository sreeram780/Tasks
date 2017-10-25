//
//  VisitingViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "VisitingViewController.h"
#import "AddVisitorViewController.h"

static  NSString*KvisitcellId = @"Kvisitcell";

@interface VisitingViewController ()<VisitorDelegate>
{
    NSMutableArray *visitors;
}
@end

@implementation VisitingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    visitors = [NSMutableArray new];
    [_visitersTable registerClass:[UITableViewCell class] forCellReuseIdentifier:KvisitcellId];
    _visitersTable.tableFooterView = [UIView new];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addVisitor)];
    self.navigationItem.rightBarButtonItem = add;
    
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateTableEverySecond)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)updateTableEverySecond
{
    [_visitersTable reloadData];
}

-(void)addVisitor
{
    AddVisitorViewController *addvisitor = [[AddVisitorViewController alloc]initWithNibName:@"AddVisitorViewController" bundle:nil];
    addvisitor.delegate = self;
    addvisitor.visitedVisitors = visitors;
    [self.navigationController pushViewController:addvisitor animated:YES];
}
#pragma mark UITableview datasource and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [visitors count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:KvisitcellId];
    cell.textLabel.text = [[visitors objectAtIndex:indexPath.row] valueForKey:@"visitorName"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ ago",[self differenceofDates:[[visitors objectAtIndex:indexPath.row] valueForKey:@"visitedDate"]]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewAutomaticDimension;
}

-(void)updatedVisitor:(NSMutableArray *)visitor
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"visitedDate" ascending:false];
    [visitors sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    [_visitersTable reloadData];
}
-(NSString*)differenceofDates:(NSString*)from
{
    NSDateFormatter *dfm = [[NSDateFormatter alloc]init];
    dfm.dateFormat = @"dd-MM-yyyy HH:mm:ss a";
    
    NSDate *fromDate = [dfm dateFromString:from];
    NSDate *toDate = [dfm dateFromString:[dfm stringFromDate:[NSDate date]]];

    
    NSDateComponents *components;
    NSInteger years;
    NSInteger months;
    NSInteger days;
    NSInteger hour;
    NSInteger minutes;
    NSInteger seconds;
    
    NSString *durationString;
    
    components = [[NSCalendar currentCalendar] components: NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate: fromDate toDate: toDate options: 0];
    
    years = [components year];
    months = [components month];
    days = [components day];
    hour = [components hour];
    minutes = [components minute];
    seconds = [components second];
    
    if(years>0)
    {
        if(years>1)
            durationString=[NSString stringWithFormat:@"%ld years",(long)years];
        else
            durationString=[NSString stringWithFormat:@"%ld year",(long)years];
        return durationString;
    }
    else if(months>0)
    {
        if(months>1)
            durationString=[NSString stringWithFormat:@"%ld months",(long)days];
        else
            durationString=[NSString stringWithFormat:@"%ld month",(long)days];
        return durationString;
    }
    
    else if(days>0)
    {
        if(days>1)
            durationString=[NSString stringWithFormat:@"%ld days",(long)days];
        else
            durationString=[NSString stringWithFormat:@"%ld day",(long)days];
        return durationString;
    }
    
    else if(hour>0)
    {
        if(hour>1)
            durationString=[NSString stringWithFormat:@"%ld hours",(long)hour];
        else
            durationString=[NSString stringWithFormat:@"%ld hour",(long)hour];
        return durationString;
    }
    
    else if(minutes>0)
    {
        if(minutes>1)
            durationString = [NSString stringWithFormat:@"%ld minutes",(long)minutes];
        else
            durationString = [NSString stringWithFormat:@"%ld minute",(long)minutes];
        
        return durationString;
    }
    else if (seconds>0)
    {
        if(seconds>1)
        durationString = [NSString stringWithFormat:@"%ld seconds",(long)seconds];
        else
            durationString = [NSString stringWithFormat:@"%ld second",(long)seconds];
        
        return durationString;

    }
    return @"";
}

@end
