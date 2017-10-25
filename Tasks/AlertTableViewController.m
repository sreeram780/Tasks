//
//  AlertTableViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 25/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "AlertTableViewController.h"
#import "DetViewController.h"

@interface AlertTableViewController ()
<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    UITableView *myTable;
    NSMutableArray *indexlist;
    UIAlertController *alert;
    NSString * name;
}

@end

@implementation AlertTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addText)];
    self.navigationItem.rightBarButtonItem = add;
    
    
        //Creating The Tableview
    myTable = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    myTable.delegate = self;
    myTable.dataSource = self;
    myTable.separatorColor = [UIColor redColor];
    myTable.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:myTable];
}
-(void)addText
{ //Creating The Alertview
    alert = [UIAlertController alertControllerWithTitle:@"" message:@"Enter Text" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField)
     {
        textField.placeholder = @"Enter Text";

     }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
        
        name = [[alert textFields] firstObject].text;
        self.title = name;
        indexlist = [[NSMutableArray alloc]initWithCapacity:0];
        
        NSMutableArray *charactersArray = [[NSMutableArray alloc]init];
        
        for (int i = 0; i<name.length; i++)
        {
            [charactersArray addObject:[name substringWithRange:NSMakeRange(i, 1)]];
        }
        
        //    Counting the characters in the string
        NSCountedSet * uniqueSet = [[NSCountedSet alloc] initWithArray:charactersArray];
        
        for (NSString *uniqueVal in uniqueSet)
        {
            NSUInteger count =  [uniqueSet countForObject:uniqueVal];
            int i = (int)count;
            NSMutableDictionary *uniqueCharacters = [[NSMutableDictionary alloc]init];

            [uniqueCharacters setValue:[NSString stringWithFormat:@"%d",i] forKey:@"count"];
            [uniqueCharacters setValue:[NSString stringWithFormat:@"%@",uniqueVal] forKey:@"character"];
            [indexlist addObject:uniqueCharacters];
        }
        
        dispatch_async(dispatch_get_main_queue(),^{
            [myTable reloadData];
        });
        
        
    }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];

}

#pragma  UITABLEVIEW DELEGATE AND DATA SOURCES

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return indexlist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier=@"cellidentifier";
    UITableViewCell *cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellidentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellidentifier];
    }
    cell.textLabel.text = [[indexlist objectAtIndex:indexPath.row] valueForKey:@"character"];
    cell.textLabel.textColor = [UIColor blueColor];
    cell.detailTextLabel.text = [[indexlist objectAtIndex:indexPath.row] valueForKey:@"count"];
    return  cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (name.length>0)
    {
        NSString* val = [NSString stringWithFormat:@"%@",[[indexlist objectAtIndex:indexPath.row] valueForKey:@"character"]];
        NSMutableArray *passArray = [NSMutableArray new];
        
        for (int i = 0; i<name.length; i++)
        {
            NSString* val2 = [name substringWithRange:NSMakeRange(i, 1)];
            if ([val isEqualToString:val2])
            {
                NSMutableDictionary *uniqueCharacter = [[NSMutableDictionary alloc]init];
                [uniqueCharacter setValue:[NSString stringWithFormat:@"%d",i] forKey:@"count"];
                [uniqueCharacter setValue:[NSString stringWithFormat:@"%@",val] forKey:@"character"];
                [passArray addObject:uniqueCharacter];
            }
        }
        
        DetViewController *det = [[DetViewController alloc]initWithNibName:@"DetViewController" bundle:nil];
        det.indexarray = [NSMutableArray arrayWithArray:passArray];
        [self.navigationController pushViewController:det animated:YES];
    }
   
}


@end
