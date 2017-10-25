//
//  DetViewController.m
//  VsplashTask
//
//  Created by sreenivasulareddy on 06/10/15.
//  Copyright (c) 2015 sreenivasulareddy. All rights reserved.
//

#import "DetViewController.h"

@interface DetViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    UITableView *myTable;
    NSMutableArray *indexlist;
}

@end

@implementation DetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title= [[_indexarray objectAtIndex:0] valueForKey:@"character"];
    
    
    myTable = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    myTable.delegate = self;
    myTable.dataSource = self;
    myTable.separatorColor = [UIColor redColor];
    myTable.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:myTable];
    

}

#pragma  UITABLEVIEW DELEGATE AND DATA SOURCES

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _indexarray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellidentifier=@"cellidentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellidentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ is at position %@ ",[[_indexarray objectAtIndex:indexPath.row] valueForKey:@"character"],[[_indexarray objectAtIndex:indexPath.row] valueForKey:@"count"]];
    cell.textLabel.textColor = [UIColor blueColor];
    return  cell;
    
}

@end
