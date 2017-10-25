//
//  EnterTextViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "EnterTextViewController.h"
#import "TextDeatilViewController.h"


@interface EnterTextViewController ()<UITextViewDelegate>

@end

static NSString* placeHolder = @"Enter text here";

@implementation EnterTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _textViewfield.text = placeHolder;
    _textViewfield.textColor = [UIColor grayColor];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches allObjects].lastObject;
    if (touch.phase == UITouchPhaseBegan)
    {
        [_textViewfield resignFirstResponder];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:placeHolder])
    {
        _textViewfield.text = placeHolder;
        _textViewfield.textColor = [UIColor lightGrayColor];
    }
    else if ([textView.text isEqualToString:@""])
    {
        _textViewfield.text = placeHolder;
        _textViewfield.textColor = [UIColor lightGrayColor];
    }
    else
    {
        _textViewfield.textColor = [UIColor blackColor];
    }
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    _textViewfield.text = @"";
    _textViewfield.textColor = [UIColor blackColor];
}
- (IBAction)sendButtonTapped:(UIButton *)sender
{
    TextDeatilViewController *textDetail = [[TextDeatilViewController alloc]initWithNibName:@"TextDeatilViewController" bundle:nil];
    
    textDetail.textViewtext = [NSString stringWithFormat:@"%@",_textViewfield.text];
    
    NSDate *now=[NSDate date];
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    [dateFormatter setDateFormat:@"HH:mm:ss a"];
    textDetail.textCreatedDate = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:now]];
    
    [self.navigationController pushViewController:textDetail animated:YES];
}

@end
