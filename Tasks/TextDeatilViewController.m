//
//  TextDeatilViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "TextDeatilViewController.h"
#import "ExpantTextTableViewCell.h"

static NSString * cellId = @"cellId";

@interface TextDeatilViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat expandedRowheight;
}
@end

@implementation TextDeatilViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_textDetailTable registerClass:[UITableViewCell class]  forCellReuseIdentifier:@"UITableViewCell"];
    
    [_textDetailTable registerNib:[UINib nibWithNibName:@"ExpantTextTableViewCell" bundle:nil] forCellReuseIdentifier:@"ExpantTextTableViewCell"];
    
    [_textDetailTable setTableFooterView:[UIView new]];
}

#pragma mark UITableview datasource and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        ExpantTextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ExpantTextTableViewCell" forIndexPath:indexPath];
        cell.messageText.text = _textViewtext;
        cell.titleMessage.text = @"Message";
        
        [cell.moreorlessButton addTarget:self action:@selector(showMoretapped:event:) forControlEvents:UIControlEventTouchUpInside];
        
    
        NSInteger lineCount = 0;
        CGSize labelSize = (CGSize){cell.messageText.frame.size.width, FLT_MAX};
        CGRect requiredSize = [cell.messageText.text boundingRectWithSize:labelSize  options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: cell.messageText.font} context:nil];
        
        // Calculate number of lines
        long charSize = lroundf(cell.messageText.font.lineHeight);//
        int rHeight = requiredSize.size.height;
        CGFloat theFloat = (rHeight/1.0)/(charSize/1.0);
        lineCount = ceil(theFloat);
        NSLog(@"%ld",(long)lineCount);
        
        if(lineCount > 3)
        {
            [cell.moreorlessButton setHidden:NO];
            cell.messageText.numberOfLines = 3;
            cell.constrainHeightofMessage.constant = 64;
            expandedRowheight =  rHeight;
        }
        else
        {
            cell.messageText.numberOfLines = 3;
            cell.constrainHeightofMessage.constant = 64;
            [cell.moreorlessButton setHidden:YES];
        }
     
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    else
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"Published By";
            cell.detailTextLabel.text = @"Sreenivasula reddy";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"Created Date";
            cell.detailTextLabel.text = _textCreatedDate;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        return 143.0;
    }
    return 44.0;
}

-(void)showMoretapped:(id)sender event:(id)event
{
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:_textDetailTable];
    NSIndexPath *indexPath = [_textDetailTable indexPathForRowAtPoint: currentTouchPosition] ;
    
    ExpantTextTableViewCell *cell = [_textDetailTable cellForRowAtIndexPath:indexPath];
    cell.isExpanded = !cell.isExpanded;
    NSString *buttonTitle;
    if (cell.isExpanded)
    {
        cell.messageText.numberOfLines = 0;
        buttonTitle = @"Less";
        [_textDetailTable beginUpdates];
        [_textDetailTable endUpdates];
    }
    else
    {
        cell.messageText.numberOfLines = 3;
        buttonTitle = @"Read More...";
        cell.constrainHeightofMessage.constant = expandedRowheight;

    }
   [cell.moreorlessButton setTitle:buttonTitle forState:UIControlStateNormal];
}


@end
