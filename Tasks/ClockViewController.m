//
//  ClockViewController.m
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import "ClockViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ClockViewController ()
{
    UIView  *gview;
}
@end

@implementation ClockViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_currentTimeLabel setHidden:NO];
    [_analogView setHidden:YES];
    _clockSwitcher.selectedSegmentIndex = 0;
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateEverySecond)
                                   userInfo:nil
                                    repeats:YES];
    [_analogView startRealTime];
    
     gview = [[UIView alloc]initWithFrame:CGRectMake(20, 250, 100, 4)];
    gview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:gview];
   
    
}

- (void)updateEverySecond
{
    NSDate *now=[NSDate date];
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    [dateFormatter setDateFormat:@"HH:mm:ss a"];
    _currentTimeLabel.text=[dateFormatter stringFromDate:now];
 
    NSDate *date = [dateFormatter dateFromString:_currentTimeLabel.text];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
  
     [self runSpinAnimationOnView:gview duration:[components second] rotations:1 repeat:YES];
}

- (IBAction)updatetoCurrentTime:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        [_currentTimeLabel setHidden:NO];
        [_analogView setHidden:YES];
    }
    else
    {
        [_currentTimeLabel setHidden:YES];
        [_analogView setHidden:NO];

    }
}



- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: duration * 6.0 ];
    ///*M_PI * 2.0 /* full rotation*/ /* rotations * duration*/
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat ? HUGE_VALF : 0;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
@end
