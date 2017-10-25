//
//  AddVisitorViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "AddVisitorViewController.h"



@interface AddVisitorViewController ()<UITextFieldDelegate>
{
    BOOL iaAlreadyVisited;
}
@end

@implementation AddVisitorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(callBackVisitor)];
    self.navigationItem.rightBarButtonItem = add;
}

-(void)callBackVisitor
{
    if (_visitorNameField.hasText)
    {
        if (_visitedVisitors.count>0)
        {
            NSDictionary *visted = [NSDictionary new];
            for (NSMutableDictionary*dic in _visitedVisitors)
            {
                if ([[dic valueForKey:@"visitorName"] isEqualToString:_visitorNameField.text])
                {
                    visted = dic;
                    iaAlreadyVisited = YES;
                    break;
                }
                else
                {
                    iaAlreadyVisited = NO;
                    [self showAlertOkbuttonActionWithMessage:@"would you like to add New Visitor"];
                }
            }
            
            if (iaAlreadyVisited==YES)
            {
                [_visitedVisitors removeObject:visted];
                NSDateFormatter *dateFormaterr = [[NSDateFormatter alloc]init];
                dateFormaterr.dateFormat = @"dd-MM-yyyy HH:mm:ss a";
                
                NSDictionary *visitor = @{
                                          @"visitorName":_visitorNameField.text,
                                          @"visitedDate":[dateFormaterr stringFromDate:[NSDate date]]};
                [_visitedVisitors addObject:visitor];
                [self.delegate updatedVisitor:_visitedVisitors];                [self.navigationController popViewControllerAnimated:true];
            }
        }
        else
        {
            iaAlreadyVisited = NO;

           [self showAlertOkbuttonActionWithMessage:@"would you like to add New Visitor"];
        }
    }
    else
    {
        [self showAlertWithMessage:@"Enter your name"];
    }
}
-(void)addVisitorToArray
{
    NSDateFormatter *dateFormaterr = [[NSDateFormatter alloc]init];
    dateFormaterr.dateFormat = @"dd-MM-yyyy HH:mm:ss a";
    
    NSDictionary *visitor = @{
                              @"visitorName":_visitorNameField.text,
                              @"visitedDate":[dateFormaterr stringFromDate:[NSDate date]]};
    [_visitedVisitors addObject:visitor];
    [self.delegate updatedVisitor:_visitedVisitors];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)showAlertWithMessage:(NSString*)message
{
    UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {[alertvc dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alertvc addAction: ok];
    [self presentViewController:alertvc animated:YES completion:nil];
}

-(void)showAlertOkbuttonActionWithMessage:(NSString*)message
{
    UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Add"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {[alertvc dismissViewControllerAnimated:YES completion:nil];
                             [self addVisitorToArray];
                              [self.navigationController popViewControllerAnimated:true];

                         }];
    UIAlertAction* cancel = [UIAlertAction
                         actionWithTitle:@"cancel"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {[alertvc dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    [alertvc addAction: ok];
    [alertvc addAction: cancel];

    [self presentViewController:alertvc animated:YES completion:nil];
}


@end
