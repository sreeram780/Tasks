//
//  ClockViewController.h
//  Tasks
//
//  Created by SreenivasulaReddy on 24/10/17.
//  Copyright © 2017 SreenivasulaReddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnalogClock.h"

@interface ClockViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *clockSwitcher;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
- (IBAction)updatetoCurrentTime:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet AnalogClock *analogView;

@end
