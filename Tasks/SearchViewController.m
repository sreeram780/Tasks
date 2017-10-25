//
//  SearchViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "SearchViewController.h"

static NSString *KcellId = @"dffdf";

@interface SearchViewController ()<UISearchBarDelegate>
{
    NSMutableArray *itemsList;
    NSMutableArray *searchedList;
    BOOL isSearching;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarView;
@property (weak, nonatomic) IBOutlet UITableView *itemTable;

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    itemsList = [NSMutableArray arrayWithObjects:@"os",
                 @"xcode",
                 @"view",
                 @"viewcontroller",
                 @"UIcontrol",
                 @"Segmentcontrol",
                 @"control",
                 @"ios",nil];
    [_itemTable registerClass:[UITableViewCell class] forCellReuseIdentifier:KcellId];
}

#pragma mark UITableview datasource and delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isSearching)
    {
        return [searchedList count];
    }
    else
    {
        return [itemsList count];
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KcellId forIndexPath:indexPath];
    if (isSearching)
    {
        cell.textLabel.text = [searchedList objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [itemsList objectAtIndex:indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewAutomaticDimension;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if(_searchBarView.text.length>0)
    {
       
        isSearching = true;
        searchedList = [[itemsList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS %@",_searchBarView.text]] mutableCopy];
        [_itemTable reloadData];
    }
        
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    _searchBarView.text = @"";
    isSearching = false;
    [_itemTable reloadData];
}

@end
